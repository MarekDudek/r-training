## Main file, running tests

library(testit)

setwd("/home/marek/Devel/data-science/r-training/coursera/assignments/assignment-1")
source("pollutantmean.R")


## Tests

pm1 <- pollutantmean("specdata", "sulfate", 1:10)
assert(round(pm1, 3) == 4.064)

pm2 <- pollutantmean("specdata", "nitrate", 70:72)
assert(round(pm2, 3) == 1.706)

pm3 <- pollutantmean("specdata", "nitrate", 23)
assert(round(pm3, 3) == 1.281)

