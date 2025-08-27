Using the following data set

```r
 path='https://raw.githubusercontent.com/gdlc/STAT_COMP/refs/heads/master/DATA'
 file='MICE.txt'
 fname=paste0(path,'/',file)
 GENO=read.table(fname,header=TRUE)
```

Create a `data.frame` named `ANS` with one row per SNP (columns in GENO) and the following columns

  - `snp` is the SNP name
  - `reference` is the reference allele being counted.
  - `allele_freq` allele frequency
  - `maf` (minor allele frequency defined as `ANS$maf=ifelse(DF$allele_freq<0.5, DF$allele_frq,1-DF$allele_freq)`.
  - `chisq`, the chi-squared for the HWE test
  - `pVal`, the p-value for the chi-sq test for HWE,
 

## Further information about the data set

The data set has the count of reference nucleotide for each SNP (single nucleotide polymorphism) 

Each row has the genotype of a mouse, and each column correspond to a SNP.

For instance

```r
 GENO[4,2]
```

has the numeber of copies of the reference allele for the 2nd SNP found in the fourth mouse. 

The allele used as reference is part of the colum-names

```r
 head(colnames(GENO))
```

The value in `GENO[4,2]` is `1` meaning that this mouse is heterozygous the 2nd SNP, with only one G allele.

We can get what the other allele is by searching for this SNP the [Jackson Lab SNP database](https://www.informatics.jax.org/)  for mice. 

We search for the 2nd SNP (ID rs3707673) in that data base and found that the other allele was A; therfore we know that the 4th mouse in this data set has genotype GA at the 2nd SNP. 

### Hints

To extract the SNP ID and the reference allele from the colum-name you can use `gsub()`

```r

name = substr(x=colnames(GENO), start=1, stop=nchar(colnames(GENO))-2)
reference = substr(x=colnames(GENO), start=nchar(colnames(GENO)), stop=nchar(colnames(GENO)))

ANS=data.frame(snp=name,reference=reference,allele_freq=NA,maf=NA,chisq=NA,pVal=NA)
```

Then fill each of the columns with NAs in a loop (over rows of ANS, i.e., columns of GENOS).


For the HWE test you will need to count the number of 0, 1, and 2 genotypes you can use the `table()` command; however, for some SNPs you may have only 1 or 2 genotypes (e.g., all 0's or all 0's or 1's). To avoid having tables with different number of entries you can consider transforming the genotype in a factor. For instance for column `72` if you do a table  you get only 2 genotypes


```r
 i=71
 x=GENO[,i]
 table(x)
```

However, if you convert it to a factor with 3 pre-specified levels you get a table with three cells

```r
 x=factor(X[,i],levels=0:2)
 table(x)
```

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
