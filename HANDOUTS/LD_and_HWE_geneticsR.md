The following script demonstrate how to estimate `D`, `D'`, and HWE test using the `genetics`
R-package. The functions `LD()` and `HWE.tes()`

**Recoding genotypes**

Here, we recode mice genotypes from the Wellcome Trust available in the BGLR R-package.

The genotypes are in allele dosage (0/1/2) we map them to coding using nuleotides.


```r
#install.packages(pkg='genetics',repos='https://cran.r-project.org/')

library(BGLR)
library(genetics)
data(mice)

## Recoding genotypes from 0/1/2 to ACGT alleles
W=matrix(nrow=nrow(mice.X),ncol=ncol(mice.X),'')

A1=substr(mice.map$alleles,start=1,stop=1)
A2=substr(mice.map$alleles,start=3,stop=3)

for(i in 1:ncol(W)){
  tmp=c(paste0(A2[i],'/',A2[i]),
        paste0(A1[i],'/',A2[i]),
        paste0(A1[i],'/',A1[i]))
  W[,i]=(tmp[mice.X[,i]+1])
}
```

**Computing LD**

```r
 LD(genotype(W[,1]),genotype(W[,2]))
```
**HWE testing**

```r
 HWE.test(genotype(W[,1])) # uses an `exact` method (Haldane's method, see reference below)

 O=table(mice.X[,1])
 p=mean(mice.X[,1])/2
 q=1-p
 n=nrow(W)
 E=n*c(q^2,2*p*q,p^2)

 # Standard chi-square test
 Chisq=sum(((O-E)^2)/E)
 pchisq(Chisq,df=1,lower.tail=FALSE)

 # Yate's test (uses continuity correction)
 Y=sum(((abs(O-E)-0.5)^2)/E)
 pchisq(Y,df=1,lower.tail=FALSE)


```
For details about various methods see [Graffelman, AJHG, 2010](https://pmc.ncbi.nlm.nih.gov/articles/PMC2869018/)/
