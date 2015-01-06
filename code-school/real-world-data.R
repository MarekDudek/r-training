## Real world data

library(testit)

# loading data
piracy <- read.csv('code-school/data/piracy.csv')
gdp <- read.table("code-school/data/gdp.txt", sep='\t', header=TRUE)

countries <- merge(x = gdp, y = piracy)

plot(countries[['GDP']], countries[['Piracy']])

cor.test(countries$GDP, countries$Piracy)

line <- lm(countries$Piracy ~ countries$GDP)
abline(line)


# better plots
help(package='ggplot2')

library(ggplot2)

weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)

qplot(weights, prices, color = types)