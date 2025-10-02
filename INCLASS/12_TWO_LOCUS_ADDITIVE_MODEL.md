## In-class 12: Additive variance in a 2 locus model


The following code calculates the probabilities of each of the four gametes as a funciton of allele frequency and the probability of one of the gametes.

```r
 # Allele frequency
 pA=0.2
 pB=0.3

 # LD parameter
 pAB=pA*pB + 0.1 # positive LD, meaning pAB>pA*pB


 # solving for the probability of other gametes
 pb=1-pB
 pAb=pA-pAB
 pab=pb-pAb
 pa=1-pA
 paB=pa-pab

 # A table with the probabilities of each of the gametes
 P=rbind(c(pab,paB),c(pAb,pAB))
 colnames(P)=c('b','B')
 rownames(P)=c('a','A')

 # sanity checks
  stopifnot(abs(sum(P)-1)<1e-6)
  stopifnot(max(abs(colSums(P)-c(pb,pB)))<1e-6)
  stopifnot(max(abs(rowSums(P)-c(pa,pA)))<1e-6)
```

Using the above probabilities we now sample gametes

```r
  N=10000

  probs=as.vector(P)
  tmp=expand.grid(rownames(P),colnames(P))
  gametes=paste0(tmp[,1],tmp[,2])
  names(probs)=gametes

  set.seed(195021) # a seed with a taste of uruguayan soccer


  # Gamete 1
  G1=sample(gametes,prob=probs, size=N,replace=TRUE)
  Z1=matrix(nrow=N,ncol=2,0)
  Z1[grep(G1,pattern='A'),1]=1
  Z1[grep(G1,pattern='B'),2]=1 

  # Gamete 2
  G2=sample(gametes,prob=probs, size=N,replace=TRUE)
  Z2=matrix(nrow=N,ncol=2,0)
  Z2[grep(G2,pattern='A'),1]=1
  Z2[grep(G2,pattern='B'),2]=1 

```

Now we form diplid genotypes by mating gametes at random, and perform some checks on the simualted data

```r
  X=Z1+Z2

  # Some sanity checks
  # checking alelel frequencies
  cbind(c(pA,pB),colMeans(X)/2)

  # checking variances
  c(2*pA*(1-pA),var(X[,1]))
  c(2*pB*(1-pB),var(X[,2]))
  
  # checking covariance
  2*(pAB-pA*pB) # covariance of diploid genotypes
  cov(X[,1],X[,2])
```


Using the data simulated above (include the *magic* seed) caluclate the additive variance for this two locus model assuming `a1=a2=0.5`, store the value in `ANS_1`.

The genic variance is the variance of genetic values in an ideal population in HWE and LE. Under these conditions we can compute variance of the genetic values in that population as the sum of the locus specific variances, each derived from allele frequencies and additive effects (a1 and a2). Compute the genic variance using this approach and store it in `ANS_2`. 



Finally, compute the sample variance at locus 1 and 2, add these variances and report it in `ANS_3`.


