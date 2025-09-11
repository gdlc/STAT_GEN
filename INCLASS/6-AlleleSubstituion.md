**Objectives**:

Estimating additive, dominance, and allele substitution effects for a one-locus models using a linear regression approach, for different settings regarding allele frequency and dominance effect.


**1) Simulate genetic values for a single locus with the following parameters:**

  - Two alleles (A/B) with pB=0.95
  - G(AA)=1, G(AB)=2.5, G(BB)=2
  - Hardy Weingberg Equilibirum.
  - Heritability =1, that is Y=G (no environmental effects)
  - Sample size (N) =100000

You can use this code to simulate the single-locus model described above

```r
 pB=0.95
 gAA=1
 gAB=2.5
 gBB=2
 X=rbinom(size=2,n=100000,prob=pB)
 G=ifelse(X==0,1,ifelse(X==1,2.5,2)
 Y=G # heritability =1
```
    
**2) Estimate `a` and `d` using OLS**

Hints: 
  - Create a dummy variable for the heterozygous `H=ifelse(X==1,1,0)`
  - Regress, using `lm()` `Y` on `X+H`
  - To retrieve estimates you can use `coef(fm)` where `fm` is the model you fitted.
  - The coefficients from this linear models are mu, a and d.  

**3) Estimate alpha**

  - Regress `G` on allele dosage (`X`) using OLS. The regression coefficient on `X` is an estimate of the average effect of allele substitution (alpha)

**4) Report**
   
From the simulation report your estimates of the intercept, `pB`,`a`, `d`, and `alpha` in a vector

```r
 ANS_1=c('pB'=,'a'= ,'d'=,'alpha'= ) 
```

**Repeat (1)-(4) using pB=0.5 and report the results in a vector named `ANS_2`.** (same format)

**Repeat (1)-(4) using pB=0.05 and d=0 and report the results in a vector named `ANS_3`.**

## Submission to Gradescope

For your submission to Gradescope provide an R-script named `assignment.R` (match case) answering the questions shown above. You may submit your answer to Gradescope as many times as needed.
