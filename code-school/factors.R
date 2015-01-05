## Factors

library(testit)

## Factors are for grouping data by category

chests <- c('gold', 'silver', 'gems', 'gold', 'gems')

types <- factor(chests)
assert(as.integer(types) == c(2, 3, 1, 2, 1))

levels <- levels(types)
assert(levels == c("gems", "gold", "silver"))

## Plots with factors

weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)

plot(weights, prices, pch=as.integer(types))
legend("topright", levels(types), pch=1:length(levels(types)))
