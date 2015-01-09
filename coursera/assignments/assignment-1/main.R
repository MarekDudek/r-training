## Main file, running tests

setwd("/home/marek/Devel/data-science/r-training/coursera/assignments/assignment-1")
source("pollutantmean.R")


## Tests

pm1 <- pollutantmean("specdata", "sulfate", 1:10)
print.("pm1 ==", pm1)

pm2 <- pollutantmean("specdata", "nitrate", 70:72)
print.("pm2 ==", pm2)

pm3 <- pollutantmean("specdata", "nitrate", 23)
print.("pm3 ==", pm3)

