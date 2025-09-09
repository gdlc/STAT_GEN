**Objectives**:

Estimating additive, dominance, and allele substitution effects for a one-locus model with over-dominance and two different values of the frequency of the allele that increases the trait values.

To do this, for each case, after you will simulate data, and then, fit two linear models: (i) an additive model `X={0,1,2}`, and (ii) one with a dominance effect `H = 1` if heterozygous, `H=0` otherwise. The first model produces estimates of `a` and `d`, the second one produces estimates of the average effect of allele substituion (alpha).

**1) Simulate genetic values for a locus with the following parameters:**

  - Two alleles (A/B) with pB=0.95
  - G(AA)=1, G(AB)=2.5, G(BB)=2
  - Hardy Weingberg Equilibirum.
  - Heritability =1, that is Y=G (no environmental effects)
  - Sample size (N) =1000

Hints: 
  - To simulate genotypes you can use `rbinom(size=2, p=pB,n=N)`
  - To map from genotypes to genetic values you can use `G=ifelse(X==0,1, ifelse(X==1,2.5,2))`

Your first answer (ANS_1) is a table with the 'G' values. 
    
**2) Estimate `a` and `d` using OLS**

Hints: 
  - Create a dummy variable for the heterozygous `D=ifelse(X==1,1,0)`
  - Regress, using `lm()` `G` on `D+Z`
  - To retrieve estimates you can use `coef(fm)` where `fm` is the model you fitted.
  - Identify the mean, 'a' and 'd' values.  

Your second answer (ANS_2) is a numeric vector with names 'a' and 'd' for the first and second position. Use the function names("your vector here") to add names to your vector.

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
