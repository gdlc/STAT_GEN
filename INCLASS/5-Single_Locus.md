In this inclass assigment you will need to compute the expected value, the variance, additive effect, and dominance deviation for a single locus under HWE.


1) **Download thefollowing Excel file, available at**: 

[Single_Locus_Model](https://www.dropbox.com/scl/fi/3o2vglpkriq3qfdrjkt4v/assignment.xls?rlkey=vjuwf4nxo303d6m22fxpg9m6s&dl=0)


The file provides a frequency for the allele A, so pA=Prob(A), and pB = Prob(B) = 1-pA, assuming the locus is biallelic (e.g., The only polymorphism possible are the A or B alleles on that position) as well as the genetic value for each genotype class (colum labeled as G in the top table).


2) **Fill the empty cells of top table (grey area)**.
     - Calculating the genoype frequency assuming HWE. 
     - Compute the information needed to compute the average genetic value (column Freq.X value) and the average squared value (column F).

3) **Fill the empty cells of the bottom table**
     - E[G]
     - Var[G]
     - a
     - d

4) Create an R-script named `assignment.R`

```r
 ANS=list(
          EXPECTED_VALUE=NA,
          VAR=NA,
          a=NA,
          d=NA
     )

```

5) Fill the NA values in the list with the values you obtained in the excel file.

6) Submit `assignment.R`

## Submission to Gradescope

  For your submission to Gradescope provide the Excel file named `assignment.xls` (lower case in the name, and lower case the extension) answering the questions shown above. 
  You may submit your answer to Gradescope as many times as needed.
