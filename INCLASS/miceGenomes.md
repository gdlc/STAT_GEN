Using the following data set

```r
 path='https://raw.githubusercontent.com/gdlc/STAT_COMP/refs/heads/master/DATA'
 file='MICE.txt'
 fname=paste0(path,'/',file)
 GENO=read.table(fname,header=TRUE)
```
Create a `data.frame` named `DF` with one row per SNP (columns in GENO) and the following columns

  - `snp=colnames(GENO)`
  - `allele_freq`
  - `maf` (minor allelel freq defined as `DF$maf=ifelse(DF$allele_freq<0.5, DF$allele_frq,1-DF$allele_freq)`.
  - `chisq`, the chi=sqare for the HWE test
  - `pVal`, the p-value for the chi-sq test for HWE,
  - `use`, a TRUE/FALSE vector, with TRUE if the SNP is a common variant (maf>0.03) and
  - `HWE$pValue>0.01/ncol(GENO)`.

To create a data frame you can use the command 'data.frame(), and the parameters will be the column names. 
A way to do this, is initiating a column with missing values to initiate the data frame, to later fill in the columns, as follows. 
(suggested code below to start below).

tmp = rep(NA, times=dim(GENO)[2])
 
DF = data.frame(
   snp         = colnames(GENO),
   allele_freq = tmp,
   maf         = tmp,
  chisq        = tmp,
  pVal         = tmp,
  use          = tmp,
  HWE          = tmp
)

## Submission to Gradescope

  For your submission to grade scope provide an R-script named `assignment.R` (match case) answering the questions shown above. 
  You may submit your answer to Gradescope as many times as needed.
