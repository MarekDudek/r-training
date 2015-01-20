library(testit)

makeVector <- function(x = numeric()) {
    
    m <- NULL
    
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    
    list(set = set, get = get, setmean = setmean, getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

v <- makeVector(1:10)
assert( v$get() == 1:10 )

v.mean <- cachemean(v)
assert( v.mean == 5.5 )
