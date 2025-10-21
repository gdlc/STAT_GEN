## This code was developed for isntructrion, please do not distribute it and use it at your own risk!
## gustavoc@msu.edu

genomicInflation=function(pvalue){
        z=qnorm(pvalue/2)
        lambda= median(z^2) / qchisq(df=1,p=0.5)
        return(lambda)
}

# estimation of inflation factor, function form GenABLE package currently not available in CRAN

estlambda<- function(data, plot=FALSE, proportion=1.0,
                        method="regression", filter=TRUE, df=1,... ) {
        data <- data[which(!is.na(data))]
        if (proportion>1.0 || proportion<=0)
                stop("proportion argument should be greater then zero and less than or equal to one")

        ntp <- round( proportion * length(data) )
        if ( ntp<1 ) stop("no valid measurements")
        if ( ntp==1 ) {
                warning(paste("One measurement, lambda = 1 returned"))
                return(list(estimate=1.0, se=999.99))
        }
        if ( ntp<10 ) warning(paste("number of points is too small:", ntp))
        if ( min(data)<0 ) stop("data argument has values <0")
        if ( max(data)<=1 ) {
#               lt16 <- (data < 1.e-16)
#               if (any(lt16)) {
#                       warning(paste("Some probabilities < 1.e-16; set to 1.e-16"))
#                       data[lt16] <- 1.e-16
#               }
                data <- qchisq(data, 1, lower.tail=FALSE)
        }
        if (filter)
        {
                data[which(abs(data)<1e-8)] <- NA
        }
        data <- sort(data)
        ppoi <- ppoints(data)
        ppoi <- sort(qchisq(ppoi, df=df, lower.tail=FALSE))
        data <- data[1:ntp]
        ppoi <- ppoi[1:ntp]
#       s <- summary(lm(data~offset(ppoi)))$coeff
#       bug fix thanks to Franz Quehenberger

        out <- list()
        if (method=="regression") {
                s <- summary( lm(data~0+ppoi) )$coeff
                out$estimate <- s[1,1]
                out$se <- s[1,2]
        } else if (method=="median") {
                out$estimate <- median(data, na.rm=TRUE)/qchisq(0.5, df)
                out$se <- NA
        } else if (method=="KS") {
                limits <- c(0.5, 100)
                out$estimate <- estLambdaKS(data, limits=limits, df=df)
                if ( abs(out$estimate-limits[1])<1e-4 || abs(out$estimate-limits[2])<1e-4 )
                        warning("using method='KS' lambda too close to limits, use other method")
                out$se <- NA
        } else {
                stop("'method' should be either 'regression' or 'median'!")
        }

        if (plot) {
                lim <- c(0, max(data, ppoi,na.rm=TRUE))
#               plot(ppoi,data,xlim=lim,ylim=lim,xlab="Expected",ylab="Observed", ...)
                oldmargins <- par()$mar
                par(mar=oldmargins + 0.2)
                plot(ppoi, data,
                     xlab=expression("Expected " ~ chi^2),
                     ylab=expression("Observed " ~ chi^2),
                     ...)
                abline(a=0, b=1)
                abline(a=0, b=out$estimate, col="red")
                par(mar=oldmargins)
        }

        out
}

updateInv=function(Z,x,ZZInv,p=ncol(Z)){
    ##
    # Updated from OneColInv.m by Emtiyaz, CS, ubc, fEB 21, 2008
    # https://emtiyaz.github.io/software.html
    # CHECKED ON mAY 31, 2024.
    ##
        u1=crossprod(Z,x)
        u2=ZZInv%*%u1
        d=1/(crossprod(x)-crossprod(u1,u2))[1,1]
        u3=d*u2
        F11Inv=ZZInv+d*tcrossprod(u2)
        WWInv=matrix(nrow=p+1,ncol=p+1)
        WWInv[1:p,1:p]=F11Inv
        WWInv[p+1,p+1]=d
        WWInv[1:p,p+1]=-u3
        WWInv[p+1,1:p]=-u3
        return(WWInv)
}

smr_ols=function(Z,ZZ,Zy,ZZInv,x,y,yy,varE=NULL,p=ncol(Z),q=p+1,n=length(y)){
        rhs=c(Zy,crossprod(x,y))
        CInv=updateInv(Z=Z,x=x,ZZInv=ZZInv,p=p)
        sol=crossprod(CInv,rhs)[q]
        if(is.null(varE)){
         r=c(Zy,crossprod(x,y))
         RSS=yy-crossprod(r,CInv)%*%r
         varE=RSS/(n-q)
        }
        SE=sqrt(CInv[q,q]*varE)
        ans=c('estimate'=sol,'SE'=SE)

        return(ans)
}

SMR.OLS=function(y,Z,X,rowsX=1:nrow(X),colsX=1:ncol(X),verbose=FALSE){

  Zy=crossprod(Z,y)
  ZZ=crossprod(Z)
  ZZInv=solve(ZZ)
  yy=sum(y^2)
  p=ncol(Z)
  q=p+1
  n=length(y)

  ANS=data.frame(snp=colnames(X)[colsX],estimate=NA,SE=NA,pValue=NA)
  for(i in 1:length(colsX)){
    x=X[rowsX,colsX[i]]
    tmp=is.na(x)
    if(any(tmp)){
      x[tmp]=mean(x,na.rm=TRUE)
    }
    ANS[i,2:3]=smr_ols(Z=Z,ZZ=ZZ,Zy=Zy,ZZInv=ZZInv,x=x,y=y,yy=yy,p=p,q=p+1,n=n)
    if(verbose){ print(i) }
  }
  ANS$pValue=pt(abs(ANS$estimate/ANS$SE),lower.tail=FALSE,df=n-q)*2
  return(ANS)
}


SMR.GLS=function(y,Z,G,X,varComp,verbose=FALSE){
 n=nrow(G)
 varU=varComp[1]
 varE=varComp[2]
 P=G*varU+diag(n)*varE
 EVD=eigen(P)
 T=EVD$vectors[,EVD$values>1e-5,drop=FALSE]
 for(i in 1:ncol(T)){
    T[,i]=T[,i]*sqrt(1/EVD$values[i])
 }
 Z=crossprod(T,Z)
 y=crossprod(T,y)

 C=crossprod(Z)
 CInv0=solve(C)
 rhs0=crossprod(Z,y)

 RES=data.frame(snp=colnames(X),estimate=NA,SE=NA)
 p=ncol(C)
 q=p+1
 for(i in 1:ncol(X)){
   x=X[,i,drop=TRUE]
   x=as.vector(crossprod(T,x))
   CInv=updateInv(Z=Z,x=x,ZZInv=CInv0,p=p)
   rhs=c(rhs0,crossprod(x,y))
   RES$estimate[i]=sum(CInv[q,]*rhs)
   RES$SE[i]=sqrt(CInv[q,q])
   if(verbose){print(i)}

  }
  RES$pValue=pt(abs(RES$estimate/RES$SE),df=n-q,lower.tail=FALSE)*2
  return(RES)
}


if(FALSE){

library(BGLR)
data(mice)

X=mice.X[,1:5000]
sex=sample(0:1,size=nrow(X),replace=TRUE)
age=runif(nrow(X))
Z=model.matrix(~sex+age)

QTL=seq(from=50,to=4950,by=1000)

signal=sex+age+rowSums(X[,QTL])
error=rnorm(nrow(X),sd=2)

y=error+signal

RES.OLS0=data.frame(snp=colnames(X),estimate=NA,SE=NA,pVal=NA)
for(i in 1:ncol(X)){
    RES.OLS0[i,2:4]=summary(lm(y~X[,i]+Z-1))$coef[1,c(1:2,4)]
}

RES.OLS=SMR.OLS(y=y,Z=Z,X=X)

varP=sum(residuals(lm(y~sex+age))^2)/(nrow(X)-ncol(Z))

RES.GLS=SMR.GLS(y=y,Z=Z,X=X,G=mice.A,varComp=c(0,varP))

h2=.3
RES.GLS2=SMR.GLS(y=y,Z=Z,X=X,G=mice.A,varComp=c(varP*h2,varP*(1-h2)))
}


