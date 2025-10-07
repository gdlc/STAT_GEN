## Inclass 13: Impact of Selecction on Allele Frequency, Linkage Disequilibrium, and Genetic Variance


The following script simulates two loci in linkage equilibrium with allele frequencies equal to 0.5.

To simulate genetic values and phenotypes we:

   - Assume the effect of the reference alleles at locus 1 and 2 are 1 and -1, respectively.
   - Compute genetic values as `g=X[,1]*1 + X[,2]*(-1)`
   - Simulate phenotyeps by adding to the genetic values a N(0,1) error term.

```r
 set.seed(12345)
 N=10000
 X=matrix(nrow=N,ncol=0)

 pA=rep(0.5,2)
 nSNP=length(pA)

 for(i in 1:nSNP){
	x=rbinom(size=2,n=N,prob=pA[i])
	X=cbind(X,x)
 }

 b=c(1,-1)
 g=X%*%b

 error=rnorm(n=N)
 y=g+error
```

Now, we select the top-300 individuals based on the simulated phenotype


```r
 top300=order(y,decreasing=TRUE)[1:300]
```

Using the data simulated by the script (keep the seed) and the selection made (`top300`) compute and report:

  - The trait heritability in the un-selected pouplation (`ANS_1`)
  - The allele frequency of locus 1 in the selected sample (`ANS_2`) 
  - The allele frequency of locus 2 in the selected sample (`ANS_3`)
  - The covariance between locus 1 and 2 in the selected sample (`ANS_4`)
  - The variance of genetic values in the original sample, i.e., before selection (`ANS_5`)
  - The variance of the genetic value sin the selected sample (`ANS_6`)

