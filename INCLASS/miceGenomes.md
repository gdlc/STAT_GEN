Using the following data set

```r
 path='https://raw.githubusercontent.com/gdlc/STAT_COMP/refs/heads/master/DATA'
 file='MICE.txt'
 fname=paste0(path,'/',file)
 GENO=read.table(fname,header=TRUE)
```
Create a `data.frame` named `DF` with one row per SNP (columns in GENO) and the following columns

  - `DF$snp=colnames(GENO)`
  - `DF$allele_freq`
  - `DF$maf` (minor allelel freq defined as `DF$maf=ifelse(DF$allele_freq<0.5, DF$allele_frq,1-DF$allele_freq)`.
  - `DF$chisq`, the chi=sqare for the HWE test
  - `DF$pVal`, the p-value for the chi-sq test for HWE,
  - `DF$use`, a TRUE/FALSE vector, with TRUE if the SNP is a common variant (maf>0.03) and `HWE$pValue>0.01/ncol(GENO)`.

