# Quiz 2

library(testit)

Sys.setlocale("LC_MESSAGES", 'en_US.UTF-8')

# Q1

cube <- function(x, n) {
    x^3
}

assert( cube(3) == 27 )
print(paste("cube(3) ==", cube(3)), quote=FALSE)

# Q2

# x <- 1:10
# if (x > 5) {
#     x <- 0
# }

# Q3
f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

z <- 10
assert( f(3) == 10 )
print(paste("f(3) ==", f(3)), quote=FALSE)

# Q4

x <- 5
y <- if (x < 3) {
    NA
} else {
    10
}

assert( y == 10 )
print(paste("y ==", y), quote=FALSE)

# Q5
h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y))
        z <- z + y
    else
        z <- z + ff
    g <- x + y / z
    if(d == 3L)
        return(g)
    g <- g + 10
    g
}

h(3)
