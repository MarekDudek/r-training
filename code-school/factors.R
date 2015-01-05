## Factors

library(testit)

## Factors are for grouping data by category

chests <- c('gold', 'silver', 'gems', 'gold', 'gems')

types <- factor(chests)
assert(as.integer(types) == c(2, 3, 1, 2, 1))

levels <- levels(types)
assert(levels == c("gems", "gold", "silver"))

## Plots with factors
