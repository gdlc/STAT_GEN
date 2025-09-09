Objectives:

Estimating additive, dominance, and allele substitution effects for a one-locus model with over-dominance and two different values of the frequency of the allele that increases the trait values.

To do this, for each case, after simulating data, you will fit two linear models: (i) with including additive and dominance effects (i.e., including as predictors `X={0,1,2}` and H= 1 if heterozygous, 0 otherwise). The first model produces estimates of `a` and `d`, the second one produces estimates of the average effect of allele substituion (alpha).

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
  - Create a dummy variable for the heterozygous `Z=ifelse(X==1,1,0)`
  - Regress, using `lm()` `G` on `X+Z`
  - To retrieve estiamtess you can use `coef(fm)` where `fm` is the model you fitted. Th 2nd and 3rd coefficients are estimates of `a` and `d` (in this case because we don't have noise esitmates will be equal to true values.

**3) Estimate alpha**

  - Regress G on allele dossage (`X`) using OLS. The regression coefficient on `X` is an estiamte of the average effect of allele substituion (alpha)

**4) Report**
   
From the simulation report your estimates of the intercept, `a`, `d`, and `alpha`using a list

```r
 ANS_1=list(a=, d=,alpha=)
```

**Repeat (1)-(34) using pB=0.05 and report the results in a list named `ANS_2`.**


## Submission to Gradescope

For your submission to Gradescope provide an R-script named `assignment.R` (match case) answering the questions shown above. You may submit your answer to Gradescope as many times as needed.
