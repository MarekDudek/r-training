## Loop functions

library(testit)

# lapply - list, coerces to list with 'as.list', returns list
# sapply - list - simplifies result
# apply  - array
# tapply - subset of vector, table
# mapply - list - multivariate

# split - useful

## lapply
x <- list(a = 1:5, b = 1:3)
x.mean <- lapply(x, mean)

assert( x.mean$a == 3 )
assert( x.mean$b == 2 )

### sapply - apply a function over a list or vector
x <- list(a = 1:5, b = 1:3)
x.mean <- sapply(x, mean)

assert (x.mean == c(3,2))

x <- 1:4
random.vectors <- lapply(x, runif) # random uniform

assert( length(random.vectors[[1]]) == 1)
assert( length(random.vectors[[2]]) == 2)
assert( length(random.vectors[[3]]) == 3)
assert( length(random.vectors[[4]]) == 4)

random.vectors <- lapply(x, runif, min = 0, max = 10) # random uniform

# anonymous functions

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
first.columns <- lapply(x, function(elt) elt[, 1])

assert( first.columns$a == c(1:2))
assert( first.columns$b == c(1:3))

## sapply
# list where evely element is lenght 1 -> vector
# list where every element is the same length -> matrix
# else -> list

## apply - apply functions over array margins

x <- matrix(rnorm(200), 20, 10)

means.in.dim.1 <- apply(x, 1, mean)
assert( length(means.in.dim.1) == 20 )

means.in.dim.2 <- apply(x, 2, mean)
assert( length(means.in.dim.2) == 10 )

## optimised 
# rowSums
# rowMeans
# colSums
# colMeans

# quantiles over matrix
quantiles = apply(x, 1, quantile, probs=c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
means <- apply(a, c(1, 2), mean)

# mapply - multiple input + function of multiple arguments
# apply a function to multiple list or vector arguments

l1 <- list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
l2 <- mapply(rep, 1:4, 4:1)

l3 <- sapply(l2, as.numeric )

for (i in 1:4) {
    assert( l1[[i]] == l3[[i]] )
}

noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}

five.values <- noise(5, 1, 2)
assert( length(five.values) == 5 )

cascaded.values <- noise(1:5, 1:5, 2)
assert( length(cascaded.values) == 5 )

cascaded.values <- mapply(noise, 1:5, 1:5, 2)
assert( class(cascaded.values) == 'list' )

# tapply - apply a function over a ragged array
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10) # generates factor levels, three levels, ten elements each

means.for.levels <- tapply(x, f, mean) # mean for each level
ranges.for.levels <- tapply(x, f, range) # range for each level

# split - divide into groups and reassemble

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split.into.groups <- split(x, f)

# idiom
means.in.groups <- lapply(split(x, f), mean)

library(datasets)

s <- split(airquality, airquality$Month)
mean.for.each.month <- lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
mean.for.each.month.siplified <- sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))

# splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
fi <- interaction(f1, f2)
s <- split(x, list(f1, f2), drop=TRUE)
