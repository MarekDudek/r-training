
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

## Matrix access

a <- matrix(1:6, 2, 3)
assert(a[2, 3] == 6) # first row, then column

a[1, 2] = 7 # changing value

second.row = a[2,]    # accessing whole row
first.column = a[,1]  # accessing whole colunn

assert(second.row == c(2, 4, 6))
assert(first.column == c(1, 2))

# accessing multiple rows and columns

b <- matrix(seq(1:15), 5, 3)

second.and.fourth.row  <- b[c(2,4), ]
first.and.third.column <- b[ ,c(1,3)]


## Plotting matrices

elevation <- matrix(1, 10, 10)
elevation[4, 6] <- 0

contour(elevation)

persp(elevation)
persp(elevation, expand=0.3)

image(elevation)

# sample data set

contour(volcano)
persp(volcano, expand=0.1)
image(volcano)
