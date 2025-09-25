### Parents' genotypes

The following code simulates genotypes for two sets of parents (`P1` and `P2`) under HWE.

```r

p=0.15    # allele frequency
nF=1000   # number of families

# Simulating genotypes of the parents
# subjects in row, each column is one of the alleles
 P1=matrix(nrow=nF,ncol=2,rbinom(n=nF*2,prob=p,size=1))
 P2=matrix(nrow=nF,ncol=2,rbinom(n=nF*2,prob=p,size=1))
 head(P1)
```

### Offspring genotypes (full sibs)

 Now we simulate offspring genotypes by mating the subjects in the ith row of P1 and P2, for each row in the parent genotypes we generate two offsrping (full sibs).

```r
# Objects to store offsping genotypes
 O1=matrix(nrow=nF,ncol=2,NA) # sibling 1
 O2=matrix(nrow=nF,ncol=2,NA) # sibling 2

for(i in 1:nF){ #loop over families
	
    # 1st offspring
    # sampling gametes
	tmp=sample(1:2,size=1) #1st meiosis
	g1=P1[i,A1]

	tmp=sample(1:2,size=1) #2nd meiosis
	g2=P1[,tmp]
	O1[i,]=c(g1,g2) 

    # 2nd offspring
    # sampling gametes
	tmp=sample(1:2,size=1) #1st meiosis
	g1=P1[i,A1]

	tmp=sample(1:2,size=1) #2nd meiosis
	g2=P1[,tmp]
	O2[i,]=c(g1,g2) 

}

```

### Genetic Values

Next, we compute the genetic values of the offspring assuming an additive model

```r
a=1 # additive effect

# computing genetic values
G1=rowSums(O1)*a
G2=rowSums(O2)*a
```

### Assignment

Use the code presented above to simulate genetic values of `nF` full sibs (G1 and G2).

Using the model parameters and the simulated genetic values, compute and report

  - `ANS_1` The genetic variance at the locus in the population (i.e., from model parameters)
  - `ANS_2` The sample variance of the simualted genetic values (hint: concatenate `G=c(G1,G1)` and compute the sample variance of `G`.
  - `ANS_3` The genetic (co)variance between the full sibs in the population (derive it from model parameters and the kinship between full sibs).
  - `ANS_4` The sample (co)variance between the genetic values of full sibs.

```r
# Genetic variance
 ANS_1=NA # genetic variance at the locus in the population. 

 ANS_2=NA # sample variance of the simualted genetic values.

# Genetic covariance
 ANS_3=NA  # the genetic covariance of full sibs in the population

 ANS_4=NA  # The covaraince between G1 and G2 in the sample


```




## Submission to Gradescope

For your submission to Gradescope provide an R-script named `assignment.R` (match case) answering the questions shown above. You may submit your answer to Gradescope as many times as needed.




