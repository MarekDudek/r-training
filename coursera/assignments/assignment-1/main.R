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
df1 <- data.frame(id=c(1), nobs=c(117))
#assert( c1 == df1 )

c2 <- complete("specdata", c(2, 4, 8, 10, 12))
df2 <- data.frame(id=c(2, 4, 8, 10, 12), nobs=c(1041, 474, 192, 148, 96))
#assert( c2 == df2 )

c3 <- complete("specdata", 30:25)
df3 <- data.frame(id=c(30, 29, 28, 27, 26, 25), nobs=c(932, 711, 475, 338, 586, 463))
#assert( c3 == df3 )

c4 <- complete("specdata", 3)
df4 <- data.frame(id=c(3), nobs=c(243))
#assert( c4 == df4 )
