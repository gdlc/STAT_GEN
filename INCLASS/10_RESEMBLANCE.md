The following code simulates genotypes for two sets of parents (`P1` and `P2`) under HWE.

```r

p=0.15    # allele frequency
nF=1000   # number of families

a=1 # additive effect


# Simulating genotypes of the parents
# subjects in row, each column is one of the alleles
 P1=matrix(nrow=nF,ncol=2,rbinom(n=nF*2,prob=p,size=1))
 P2=matrix(nrow=nF,ncol=2,rbinom(n=nF*2,prob=p,size=1))

```
 Now we simulate offspring genotypes, 2 offspring

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

# computing genetic values
G1=rowSums(O1)*a
G2=rowSums(O2)*a
```

```r
# Population parameters
 ANS_1=NA # compute and store here the genetic variance
          # at the locus in the population. 

 ANS_2=NA # compute ans store here the
          # covariance between G1 and G2 in the popualtion

# Sample parameters
 ANS_3=NA  # compute and store here the sample variance 
           # of X=c(G1,G2)

# Sample parameters
 ANS_4=NA  # compute and store here the sample covariance 
           # betwwen G1 and G2


```
