## Main file, running tests

library(testit)

setwd("/home/marek/Devel/data-science/r-training/coursera/assignments/assignment-1")

## Part 1

source("pollutantmean.R")

pm1 <- pollutantmean("specdata", "sulfate", 1:10)
assert(round(pm1, 3) == 4.064)

pm2 <- pollutantmean("specdata", "nitrate", 70:72)
assert(round(pm2, 3) == 1.706)

pm3 <- pollutantmean("specdata", "nitrate", 23)
assert(round(pm3, 3) == 1.281)


# Part 2

source("complete.R")

c1 <- complete("specdata", 1)
assert( c1 == data.frame(id=c(1), nobs=c(117)) )

c2 <- complete("specdata", c(2, 4, 8, 10, 12))
assert( c2 == data.frame(id=c(2, 4, 8, 10, 12), nobs=c(1041, 474, 192, 148, 96)) )

c3 <- complete("specdata", 30:25)
assert( c3 == data.frame(id=c(30, 29, 28, 27, 26, 25), nobs=c(932, 711, 475, 338, 586, 463)) )

c4 <- complete("specdata", 3)
assert( c4 == data.frame(id=c(3), nobs=c(243)) )


# Part 3

source("corr.R")

cr1 <- corr("specdata", 150)
assert( round(head(cr1), 5) == c(-0.01896, -0.14051, -0.04390, -0.06816, -0.12351, -0.07589) )
summary1 <- summary(cr1)
assert( summary1['Min.']    == -0.21060 )
assert( summary1['1st Qu.'] == -0.04999 )
assert( summary1['Median']  ==  0.09463 )
assert( summary1['Mean']    ==  0.12530 )
assert( summary1['3rd Qu.'] ==  0.26840 )
assert( summary1['Max.']    ==  0.76310 )

cr2 <- corr("specdata", 400)
assert( round(head(cr2), 5) == c(-0.01896, -0.04390, -0.06816, -0.07589,  0.76313, -0.15783) )
summary2 <- summary(cr2)
assert( summary2['Min.']    == -0.17620 )
assert( summary2['1st Qu.'] == -0.03109 )
assert( summary2['Median']  ==  0.10020 )
assert( summary2['Mean']    ==  0.13970 )
assert( summary2['3rd Qu.'] ==  0.26850 )
assert( summary2['Max.']    ==  0.76310 )

cr3 <- corr("specdata", 5000)
assert( length(cr3) == 0 )
summary3 <- summary(cr3)
assert( is.na(summary3['Min.']))
assert( is.na(summary3['1st Qu.']))
assert( is.na(summary3['Median']))
assert( is.na(summary3['Mean']))
assert( is.na(summary3['3rd Qu.']))
assert( is.na(summary3['Max.']))

cr4 <- corr("specdata")
assert( length(cr4) == 323 )
summary4 <- summary(cr4)
assert( summary4['Min.']    == -1.00000 )
assert( summary4['1st Qu.'] == -0.05282 )
assert( summary4['Median']  ==  0.10720 )
assert( summary4['Mean']    ==  0.13680 )
assert( summary4['3rd Qu.'] ==  0.27830 )
assert( summary4['Max.']    ==  1.00000 )
