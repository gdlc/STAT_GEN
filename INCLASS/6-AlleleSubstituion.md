**Objectives**:

Estimating additive, dominance, and allele substitution effects for a one-locus model with over-dominance and two different values of the frequency of the allele that increases the trait values.


**1) Simulate genetic values for a single locus with the following parameters:**

  - Two alleles (A/B) with pB=0.95
  - G(AA)=1, G(AB)=2.5, G(BB)=2
  - Hardy Weingberg Equilibirum.
  - Heritability =1, that is Y=G (no environmental effects)
  - Sample size (N) =100000

Hints: 
  - To simulate genotypes you can use `rbinom(size=2, p=pB,n=N)`
  - To map from genotypes to genetic values you can use `G=ifelse(X==0,GAA, ifelse(X==GAB,GBB))`
    
**2) Estimate `a` and `d` using OLS**

Hints: 
  - Create a dummy variable for the heterozygous `H=ifelse(X==1,1,0)`
  - Regress, using `lm()` `G` on `X+H`
  - To retrieve estimates you can use `coef(fm)` where `fm` is the model you fitted.
  - The coefficients from this linear models are mu, a and d.  

**3) Estimate alpha**

  - Regress `G` on allele dosage (`X`) using OLS. The regression coefficient on `X` is an estimate of the average effect of allele substitution (alpha)

**4) Report**
   
From the simulation report your estimates of the intercept, `pA`,`a`, `d`, and `alpha` in a vector

```r
 ANS_1=c('a'= ,'d'=,'alpha'= ) 
```

**Repeat (1)-(4) using pB=0.5 and report the results in a vector named `ANS_2`.** (same format)

**Repeat (1)-(4) using pB=0.05 and d=0 and report the results in a vector named `ANS_3`.**

## Submission to Gradescope

For your submission to Gradescope provide an R-script named `assignment.R` (match case) answering the questions shown above. You may submit your answer to Gradescope as many times as needed.
