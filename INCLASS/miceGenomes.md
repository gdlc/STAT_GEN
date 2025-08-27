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

The data set has mice genotypes (100 mice) at 1000 SNPs (columns).

For instance

```r
 GENO[4,2]
```

has the number of copies of the reference allele for the 2nd SNP found in the fourth mouse. 

The allele used as reference is part of the colum-names

```r
 head(colnames(GENO))
```

The value in `GENO[4,2]` is `1` meaning that this mouse is heterozygous the 2nd SNP, with only one G allele.

We can find what the other allele is by searching for this SNP the [Jackson Lab SNP database](https://www.informatics.jax.org/)  for mice. 

We searched for the 2nd SNP (ID rs3707673)  and found that the other allele was A; therfore we know that the 4th mouse in this data set has genotype GA at the 2nd SNP. 

### Hints

To extract the SNP ID and the reference allele from the colum-name you can use `gsub()`

```r
name = substr(x=colnames(GENO), start=1, stop=nchar(colnames(GENO))-2)
reference = substr(x=colnames(GENO), start=nchar(colnames(GENO)), stop=nchar(colnames(GENO)))

```

To create the requested `ANS` data frame you can use


```r
 ANS=data.frame(snp=name,reference=reference,allele_freq=NA,maf=NA,chisq=NA,pVal=NA)
```

Then you will fill each of the columns with NAs in a loop (over rows of ANS, i.e., columns of GENOS).

For the HWE test you will need to count the number of 0, 1, and 2 genotypes you can use the `table()` command; however, for some SNPs you may have only 1 or 2 genotypes (e.g., all 0's or all 0's and 1's). To avoid having tables with different number of entries you can consider transforming the genotype in a factor. 

Example: consider colmun `72`, if you do a table  you get only 2 genotypes

```r
 i=71
 x=GENO[,i]
 table(x)
```

However, if you convert it to a factor with 3 pre-specified levels you get a table with three cells

```r
 i=71
 x=factor(X[,i],levels=0:2)
 table(x)
```

That table will alwasy have counts of 0's, 1's and 2's in that order. You can create a similar vector for the expected number of genotypes and then calculate the HWE chi-sq. 


## Submission to Gradescope

  For your submission to grade scope provide an R-script named `assignment.R` (lower case in the name, upper case the extension) answering the questions shown above. 
  You may submit your answer to Gradescope as many times as needed.
