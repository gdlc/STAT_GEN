```
nAa=160
naa=310
nAlleles=(nAA+nAa+naa)*2
n = nAA + nAa + naa

SOL_1 = c(nAA,nAa,naa)
names(SOL_1) = c('AA', 'Aa', 'aa')
p=(nAA*2+nAa)/nAlleles
q=1-p

SOL_2 = c(p,q)
names(SOL_2) = c('p','q')

SOL_3 = c(p^2, 2*p*q, q^2)*n
names(SOL_3) = c('AA', 'Aa', 'aa')

chisqST = sum( (SOL_1-SOL_3)^2 /SOL_3)

SOL_4 = pchisq( chisqST, df=1, lower.tail=F)

```
