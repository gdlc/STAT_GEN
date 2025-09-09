1) Simulate genetic values for a locus with the following parameters:

  - Two alleles (A/B) with pB=0.75
  - G(AA)=1, G(AB)=2.5, G(BB)=2
  - Hardy Weingberg Equilibirum.
  - Heritability =1, that is Y=G (no environmental effects)
  - Sample size (N) =1000

Hints: 
  - To simulate genotypes you can use `rbinom(size=2, p=pB,n=N)`
  - To map from genotypes to genetic values you can use `G=ifelse(X==0,1, ifelse(X==1,2.5,2))`
    
2) Estimate `a` and `d` using OLS

Hints: 
  - Create a dummy variable for the heterozygous `Z=ifelse(X==1,1,0)`
  - Consider regressing, using `lm()` `G` on `X+Z`
  - To retrieve estiamtess you can use `coef(fm)` where `fm` is the model you fitted.

3) Report
   
From the simulation report your estimates of the intercept, `a` and `d` using a list

```r
 ANS_1=list(mu=, a=, d=)
```

Repeat (1)-(3) using pB=0.25 and report the results in a list named `ANS_2`.


## Submission to Gradescope

  For your submission to Gradescope provide an R-script named `assignment.R` (match case) answering the questions shown above. 
  You may submit your answer to Gradescope as many times as needed.
