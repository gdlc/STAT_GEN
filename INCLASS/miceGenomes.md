Using the following data set

```r
 path='https://raw.githubusercontent.com/gdlc/STAT_COMP/refs/heads/master/DATA'
 file='MICE.txt'
 fname=paste0(path,'/',file)
 GENO=read.table(fname,header=TRUE)
```
The data has the count of reference nucleotide for each SNP. The column are SNPs in the genotype, and the rows are mice. 
GENO[4,2] for instance, is the genotype of fourth mouse (row '4'), SNP rs3707673 (column '2'). This subject is heterozygous for this position, with only one G, genotype: GA. We know that this particular SNP alternative nucleotide is 'A' because we searched it in the Jackson Lab SNP database for mice: 
https://www.informatics.jax.org/
There we did a quick search for rs3707673
The column name of the GENO has the SNP name, and the last two characters are an underscore separator and the nucleotide allele used as reference to count.  

Separate the SNP name and the reference nucleotide: 
1-Extract the SNP name by removing the last 2 characters.
2-Save the reference nucleotide allele (stored in the last character) 
3-Check your work.

```r
#1
name = substr(x=colnames(GENO), start=1, stop=nchar(colnames(GENO))-2)
#2
reference = substr(x=colnames(GENO), start=nchar(colnames(GENO)), stop=nchar(colnames(GENO)))
#3
cbind(colnames(GENO), name, reference)
```

Create a `data.frame` named `DF` with one row per SNP (columns in GENO) and the following columns

  - `snp` is the SNP name
  - `reference` is the reference allele being counted.
  - `allele_freq` allele frequency
  - `maf` (minor allele frequency defined as `ANS$maf=ifelse(DF$allele_freq<0.5, DF$allele_frq,1-DF$allele_freq)`.
  - `chisq`, the chi-squared for the HWE test
  - `pVal`, the p-value for the chi-sq test for HWE,
  - `use`, a TRUE/FALSE vector, with TRUE if the SNP is a common variant (maf>0.03) and


To create a data frame you can use the command 'data.frame(), and the parameters will be the column names. 
A way to do this, is initiating a column with missing values to initiate the data frame, to later fill in the columns, as follows. 
(suggested code below to start below).

```r
tmp = rep(NA, times=dim(GENO)[2])

DF = data.frame(
   snp         = name,
   reference   = reference,
   allele_freq = tmp,
   maf         = tmp,
  chisq        = tmp,
  pVal         = tmp,
  use          = tmp
)
```

ANS_1 : should be the MAF: ANS_1 = DF$maf

ANS_2 : should be the chisq statistics of the HWE test, ANS_2 = DF$chisq

ANS_3 : the pValue, ANS_3 = DF$pVal

ANS_4 : should be a number with the proportion of common variants that do not pass HWE.


## Submission to Gradescope

  For your submission to grade scope provide an R-script named `assignment.R` (lower case in the name, upper case the extension) answering the questions shown above. 
  You may submit your answer to Gradescope as many times as needed.
