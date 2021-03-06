## Vectors

library(testit)

## c - short for combine
vector <- c(4, 7, 9)

vector.logical <- c(T, F, T, F, T)
vector.string  <- c("a", "b", "c")

## vectors cannot hold values with different modes (types)
vector <- c(TRUE, "string", 23)

assert(vector == c("TRUE", "string", "23"))

## vectors hold values and not references
number <- 3
vector <- c(number, number, number)
number <- 5

assert(vector[1] == 3)

## sequences
ten  <- 1:5
assert(ten  == c(1, 2, 3, 4, 5))

ten <- seq(1, 5)
assert(ten == c(1, 2, 3, 4, 5))

## sequences with step
every.half <- seq(1, 3, 0.5)
every.third <- seq(1, 3, 1/3)

## seems like real fractions are used, for creating sequences at least
assert(every.third[4] == 2)

## for division and multiplication too
third <- 1/3
thousand <- third * 1000 * 3

assert(thousand == 1000)
## or some kind of coercion

## sequences can be descending, also with step
descending <- seq(10, 1)
descending.with.step <- seq(10, 1, -2)

## indices start with ONE, not zero
assert(descending[1] == 10)
assert(descending[10] == 1)

## changing value in vector
vector <- 1:5
vector[3] <- 6

## adding value in vector
vector[6] <- 3

## adding value with blanks
vector[10] <- 10
blank.value <- vector[8]

assert(is.na(blank.value))
## NA stands for Not Available

## accessing multiple values with vector of indices
sentence <- c('quick', 'brown', 'fox', 'jumped', 'over', 'the', 'lazy', 'dog')
nouns <- sentence[c(3, 8)]

assert(nouns == c('fox', 'dog'))

## Vector names
ranks <- 1:3
names(ranks) <-c('first', 'second', 'third')

assert(ranks["first"] == 1)

ranks['second'] <- 4

assert(ranks["second"] == 4)

## Plotting one vector
vesselsSunk <- c(4, 5, 1)
barplot(vesselsSunk)

names(vesselsSunk) <- c("England", "France", "Norway")
barplot(vesselsSunk)

## Vector math
a <- c(1, 2, 3)
a <- a + 1

assert(a[1] == 2)

a <- a + a

assert(a[1] == 4)

a <- c(1, 3, 5)
b <- c(2, 3, 4)
comparison <- a < b

assert(comparison[3] == FALSE)

a <- seq(0, 2, 0.5)
a <- pi * a
sines <- sin(a)

## Scatter plots
x <- seq(1, 20, 0.1)
y <- sin(x)
plot(x, y)

y <- abs(y)
plot(x, y)

## NA values
vector <- c(1, 3, NA)
s <- sum(vector)

assert(is.na(s))

s <- sum(vector, na.rm = TRUE)

assert(!is.na(s))
