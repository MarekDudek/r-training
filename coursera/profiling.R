

t1 <- system.time(str(str))

# amount of time it took to evaluate expression

t2 <- system.time({
    x <- 1:10000
})

# proc_time - time in seconds
## user time        time to charge CPU !!! misleading name
## elapsed time     user experienced time, wall clock time

## user time < elapsed time     CPU time < wall clock time      - lots of waiting
## user time > elapsed time     CPU time > wall clock time      - parallel processing



user.time <- t2['user.self']

t3 <- system.time({
    #readLines("http://www.jhsph.edu")
})

Rprof()

for (i in 1:100000) {
    x <- rnorm(1000)
    m <- mean(x)
}

Rprof(NULL)

# by.self - subtracts 