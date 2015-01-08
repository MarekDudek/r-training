## Reading tabular data

# dput/dget
y <- data.frame(a=1, b="a")

file.name <- "coursera/data/y.R"

dput(y, file=file.name)
new.y <- dget(file.name)

assert(y == new.y)

# dump/source

x <- "foo"
y <- data.frame(a=1, b="a")

file.name <- "coursera/data/xy.R"

dump(c("y", "x"), file.name)
source(file.name)

# Connections
conn <- file(file.name)
str(file)
close(conn)