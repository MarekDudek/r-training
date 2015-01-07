## Data types

print("Data types")
library(testit)

x <- "hello"
x[2] <- "world"

sequence <- 1:20

# Five basic (atomic) classes of objects
## character
## numeric (real numbers)
## integers
## complex
## logical

empty.vector.logical <- vector()
empty.vector.logical <- vector('logical')

empty.vector.character <- vector('character')
empty.vector.numeric <- vector('numeric')
empty.vector.integer <- vector('integer')
empty.vector.complex <- vector('complex')

vector.of.length <- vector('logical', 5)
vector.of.length <- vector(length=5)

vector.of.complex <- c(1+0i, 2+4i)

# Numeric isn't always integer

y <- 1
assert(is.numeric(y))
assert(!is.integer(y))

y <- 1L
assert(is.numeric(y))
assert(is.integer(y))

# Special number for infinity
zero = 1/Inf
assert(zero == 0)

# Not a number
assert(is.nan(NaN))
assert(is.nan(1*NaN)) # Operations yeild NaN
assert((is.na((1*NaN) == NaN))) # Comparisons are of Not Available value

# Not available
assert(is.na(NA))
assert(is.na(1*NA))
assert((is.na((1*NA) == NA))) 

# NULL value
null <- NULL
assert(is.null(null))

## vectors can only hold object of the same class
## except lists

list <- list(1, "a", TRUE, 1+4i)
assert(list[1] == 1)
assert(list[2] == 'a')

# Attributes
## names, dimnames
## dimensions
## class
## length
## other, user-defined


assert(is.null(attributes(1)))

# Coersion
assert(is.character(c(1.7, "a")))
assert(is.numeric(c(TRUE, 2)))
assert(is.character(c("a", FALSE)))

# Explicit coersion
x <- 0:6
assert(class(x) == 'integer')

x <- as.numeric(x)
assert(class(x) == 'numeric')

x <- as.logical(x)
assert(class(x) == 'logical')

x <- as.character(x)
assert(class(x) == 'character')

# Matrices
m1 <- matrix(nrow = 2, ncol = 3)
assert(dim(m1) == c(2, 3))

m2 <- 1:10
dim(m2) <- c(2,5)

x <- 1:3
y <- 10:12

m3 <- cbind(x, y)
assert(dim(m3) == c(3, 2))

m4 <- rbind(x, y)
assert(dim(m4) == c(2, 3))

# Factors - special kind of vector, self-describing
## ordered
## unorders

# have level attribute
f <- factor(c("yes", "yes", "no", "yes", "no")) 

table(f)  # frequency count
unclass(f)

f <- factor(c("yes", "yes", "no", "yes", "no"), levels=c('yes', 'no')) 

# Missing values
x <- c(1, 2, NA, 10, 3)
x.is.na = is.na(x)

## Data frames - tabular data
# special type of list
# every 
# every element is column of data
# attribute row.names

df <- data.frame(foo = 1:4, bar = c(T, T, F, F))
assert(nrow(df) == 4)
assert(ncol(df) == 2)

m <- data.matrix(df)

# Names - for every object
x <- 1:3
assert(is.null(names(x)))

names(x) <- c("foo", "bar", "norf")
assert(names(x) == c("foo", "bar", "norf"))

x <- list(a = 1, b = 2, c = 3)
assert(names(x) == c("a", "b", "c"))

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))

d <- dimnames(m)
assert(d[[1]] == c("a", "b"))
assert(d[[2]] == c("c", "d"))
