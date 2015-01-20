## Quiz 4

# Q1
set.seed(1)
q1 <- rpois(5, 2)

# Q5

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x, y)

# Q8

library(datasets)

x1 <- 1:100
x2 <- 101:200
y <- x1 + x2

Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)






# Q1

set.seed(1)
rpois(5, 2)
