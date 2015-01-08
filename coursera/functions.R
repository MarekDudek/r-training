## Functions

add2 <- function(x, y) {
    x + y
}

assert(add2(3, 4) == 7)

above10 <- function(x) {
    use <- x > 10
    x[use]
}

assert(above10(10:13) == c(11, 12, 13))

above <- function(x, n = 10) {
    use <- x > n
    x[use]
}

assert(above10(10:13) == above(10:13, 10))
assert(above10(10:13) == above(10:13))

columnmean <- function(y, removeNA=TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(y[,i], na.rm = removeNA)
    }
    means
}

means <- columnmean(airquality)

print(means)

f <- function(first, second=1) {
    print(formals(f))
}

f(fi=2) # formal argument can be missing and partially matched

print("varargs")
f2 <- function(a, b, ...) {
    print(formals(f2))
}

f2()

print(paste("a", 1 ,"b", 1.1, TRUE, "c"))

args(paste)
args(cat)

## scoping

search()


make.power <- function(n) {
    pow <- function(x) {
        x^n
    }
    pow
}

cube <- make.power(3)

assert(cube(2)==8)

ls(environment(cube))
assert(get("n", environment(cube)) == 3)
