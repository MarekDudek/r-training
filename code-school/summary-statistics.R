## Summary statistics

library(testit)

## Mean

numbers <- 1:10
mean <- mean(numbers)

assert(mean == 5.5)

# plotting data with mean
barplot(numbers)
abline(h=mean)


## Median

limbs <- c(4, 3, 4, 3, 2, 4, 4, 14)

mean   <- mean(limbs)
median <- median(limbs)

barplot(limbs)
abline(h=mean, col="red")
abline(h=median, col="blue")

## Standard deviation

pounds <- c(45000, 50000, 35000, 40000, 35000, 45000, 10000, 15000)

barplot(pounds)
abline(h=mean(pounds),   col="blue")
abline(h=median(pounds), col="green")

deviation <- sd(pounds)

abline(h=meanValue + deviation, col="red")
abline(h=meanValue - deviation, col="red")
