
# 4
x <- 4
print(class(x))

# 5
x <- c(4, TRUE)
print(class(x))

# 6
x <- c(1, 3, 5)
y <- c(3, 2, 10)
r <- rbind(x, y)
print(r)

# 8
x <- list(2, "a", "b", TRUE)
r <- x[[2]]
print(class(r))

# 9
x <- 1:4
y <- 2
r <- x+y
print(class(r))
print(r)

# 10
x <- c(3, 5, 1, 10, 12, 6)
less.than.six <- x[x <= 5]
x[x <= 5] <- 0
print(x)

# Preparing data
getwd()
list.files("coursera/data")
data.file.path = "coursera/data/hw1_data.csv"

# 11
data <- read.csv(data.file.path)
print(names(data))

# 12
data <- read.csv(data.file.path, nrows=2)
print(data)

# 13
data <- read.csv(data.file.path)
print(nrow(data))

# 14
data <- read.csv(data.file.path)
tail(data, n=2)

# 15
data <- read.csv(data.file.path)
data[47, "Ozone"]

# 16
data <- read.csv(data.file.path)
ozone.column <- data[, "Ozone"]
class(ozone.column)

bad.flags  <- is.na(ozone.column)
bad.values <- ozone.column[bad.flags]
print(length(bad.values))

# 17
good.values <- ozone.column[!bad.flags]
mean <- mean(good.values)
print(mean)

# 18
data <- read.csv(data.file.path)

data.fulfiling.condition <- data[data$Ozone > 31 & data$Temp > 90, ]
solar.r.in.data <- data.fulfiling.condition$Solar.R
good.data <- solar.r.in.data[!is.na(solar.r.in.data)]
mean <- mean(good.data)

# 19
data <- read.csv(data.file.path)
in.month.6 <- data[data$Month == 6,]
temp.in.month.6 <- in.month.6$Temp
mean.temp.in.month.6 <- mean(temp.in.month.6)

# 20
data <- read.csv(data.file.path)
in.may <- data[data$Month == 5,]
ozon.in.may <- in.may$Ozon
max.ozon.in.may <- max(ozon.in.may[!is.na(ozon.in.may)])
