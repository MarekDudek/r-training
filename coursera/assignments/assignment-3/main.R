
library(testit)

setwd('/home/marek/Education/coursera/data-science/r-training/coursera/assignments/assignment-3')

outcome <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')

column.names <- names(outcome)

thirty.day.death.rates.from.heart.attack <- outcome[, 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack']
hist(as.numeric(thirty.day.death.rates.from.heart.attack))