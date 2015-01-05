
library(testit)

## Matrices

m <- matrix(0, 3, 4) # filled with zeros, three rows, four columns

a <- 1:12
m <- matrix(a, 3, 4) # filled with valus from vector, filled by columns

# Reshaping vector into matrix

plank <- 1:8
dim(plank) <- c(2, 4)
dim(plank) <- c(4, 2)

truth.table = matrix(c(T,T, F, F, T, F, T, F), 4, 2) # matrices can hold any type of value
