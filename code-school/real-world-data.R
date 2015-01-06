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
