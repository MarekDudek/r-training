library(testit)

library(datasets)
data(iris)

# Q1
divided.by.species <- split(iris, iris$Species)
sepal.length.mean <- mean(divided.by.species$virginica$Sepal.Length)

assert( sepal.length.mean == 6.588 )


# Q2
means <- apply(iris[, 1:4], 2, mean)

assert( round(means[1], 6) == 5.843333 )
assert( round(means[2], 6) == 3.057333 )
assert( round(means[3], 6) == 3.758000 )
assert( round(means[4], 6) == 1.199333 )


# Q3
data(mtcars)

split.by.mpg.cyl <- split(mtcars$mpg, mtcars$cyl)

avg.mpg.by.cyl <- sapply(split.by.mpg.cyl, mean)

# Q4

split.by.hp.cyl <- split(mtcars$hp, mtcars$cyl)
avg.hp.by.cyl <- sapply(split.by.hp.cyl, mean)

# Q5
