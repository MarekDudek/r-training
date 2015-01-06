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
