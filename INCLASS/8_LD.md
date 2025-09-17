
1) Read genotypes
 (Mice genotypes for 100 SNPs)

```r
 W=read.csv('https://raw.githubusercontent.com/gdlc/STAT_GEN/refs/heads/main/DATA/100_mice_snps.csv',row.names=1)
```

2) Recode genotypes from A/C/G/T to allele dossage format (0/1/2)

``r
 recode=function(x){ as.integer(factor(x))-1 }
 X=apply(FUN=recode,X=W,MARGIN=2)
```

3) Compute LD between the SNP in the first column and each of the other SNPs

```r
  ANS_1=rep(NA,ncol(W)-1) # Use this vector to store the absolute value of D
  ANS_2=ANS_1
```
Hints:

  - Within a loop (from `1:I(ncol(W)0-1)`) compute
     - D using `LD(genotype(W[,1]),genotype(W[,i+1]))$D`
     - Store abs(D) in `ANS_1[i]`
     - Compute `abs(cor(X[,1],X[,i+1]))` and store it in `ANS_2[i]`.
   
