
## Assignment

Using Galton's data set, compute and report the OLS regression coefficient for the following regressions:

  - ANS_1: regression of offsping height on mother's height
  - ANS_2: regression of offsping height on father's height
  - ANS_3: regression of offsping hieght on parental average (PA=(Mother+Father)/2), you will first need to create this variable in DATA.
  - ANS_4: same as ANS_3, derived from a regression where you also inlcude Gender as a covariate.


  You can read the data using this script

```r
 fname='https://raw.githubusercontent.com/gdlc/STAT_COMP/refs/heads/master/DATA/GALTON.csv'
 DATA=read.csv(fname,header=TRUE)  
```

Return in ANS_1, ANS_2,... etc. only the OLS esitmated coefficeint for the regression of offsping height on parental height (scalar).

To extract coefficients you can use `coef(fm)`, where `fm` is the fitted OLS regression.


## Submission to Gradescope

  For your submission to grade scope provide an R-script named `assignment.R` (match case) answering the questions shown above. 
  You may submit your answer to Gradescope as many times as needed.
