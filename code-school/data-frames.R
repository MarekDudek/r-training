## Data frames

library(testit)

# used for binding values like weights, prices and types

chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)

weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)

treasure <- data.frame(weights, prices, types)

# Data frame access

single.column.dataframe <- treasure[2]

vector.by.number  <- treasure[[2]]
vector.by.name    <- treasure[['prices']]
vector.by.field   <- treasure$prices

assert(vector.by.number == vector.by.name)
assert(vector.by.number == vector.by.field)

# Loading data frames

list.files("code-school/data")

targets <-read.csv("code-school/data/targets.csv")

infantry <- read.table("code-school/data/infantry.txt", sep='\t', header=TRUE)
