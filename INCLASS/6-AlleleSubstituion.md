**Objectives**:

Estimating additive, dominance, and allele substitution effects for a one-locus model with over-dominance and two different values of the frequency of the allele that increases the trait values.

To do this, for each case, after you will simulate data, and then, fit two linear models: (i) an additive model `X={0,1,2}`, and (ii) one with a dominance effect `H = 1` if heterozygous, `H=0` otherwise. The first model produces estimates of `a` and `d`, the second one produces estimates of the average effect of allele substitution (alpha).

**1) Simulate genetic values for a locus with the following parameters:**

  - Two alleles (A/B) with pB=0.95
  - G(AA)=1, G(AB)=2.5, G(BB)=2
  - Hardy Weingberg Equilibirum.
  - Heritability =1, that is Y=G (no environmental effects)
  - Sample size (N) =1000

Hints: 
  - To simulate genotypes you can use `rbinom(size=2, p=pB,n=N)`
  - To map from genotypes to genetic values you can use `G=ifelse(X==0,1, ifelse(X==1,2.5,2))`
    
**2) Estimate `a` and `d` using OLS**

Hints: 
  - Create a dummy variable for the heterozygous `D=ifelse(X==1,1,0)`
  - Regress, using `lm()` `G` on `D+Z`
  - To retrieve estimates you can use `coef(fm)` where `fm` is the model you fitted.
  - Identify the mean, 'a' and 'd' values.  

**3) Estimate alpha**

  - Regress G on allele dosage (`X`) using OLS. The regression coefficient on `X` is an estimate of the average effect of allele substitution (alpha)

**4) Report**
   
From the simulation report your estimates of the intercept, `pA`,`a`, `d`, and `alpha` in a vector

```r
 ANS_2=c( , , ) # concatenate here your a, d, and alpha values
names(ANS_2) = c('pA', 'a','d','alpha')
```

**Repeat (1)-(4) using pA=0.5 and report the results in a vector named `ANS_2`.**

**Repeat (1)-(4) using pA=0.05 and d=0 and report the results in a vector named `ANS_3`.**

## Submission to Gradescope

For your submission to Gradescope provide an R-script named `assignment.R` (match case) answering the questions shown above. You may submit your answer to Gradescope as many times as needed.
