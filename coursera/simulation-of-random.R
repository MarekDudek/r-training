
library(testit)

## Str function
str(str)

x <- rnorm(100, 2, 4)
f <- gl(40, 10)


# Simulation

# rnorm - random Normal variates, with given mean and standard deviation
# dnorm - normal probablity density
# pnorm - cummmulative distribution for Normal distribution

# rpois random Poisson variates for rate

# d - density
# r - random number
# p - cumulative
# q - quantile function

set.seed(1)
random.numbers <- rnorm(5)

set.seed(1)
random.numbers.again <- rnorm(5)

assert( random.numbers == random.numbers.again )

# linear ode

set.seed(20)

x <- rnorm(100)
e <- rnorm(100, 0, 2)

y <- 0.5 + 2 * x + e

summary(y)
plot(x, y)


set.seed(10)

x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)

y <- 0.5 + 2 * x + e

summary(y)
plot(x, y)


