## Arithmetic
two   <- 1 + 1
four  <- two * two
eight <- 16 / two
six   <- eight - two

## Logical
logical.false <- TRUE == FALSE
logical.true  <- T != F

## Strings
string <- "strings in double quotes"
string <- 123
string <- "value of variable can be reassigned, even to different type"

## Printing to console
print("value to print", quote=FALSE)

## Functions
twenty <- sum(two, four, six, eight)
string.vector <- rep("hello", times=3)
four <- sqrt(4)

## Help
# help(sum)
# example(print)

## File operation
list.files()
list.files("code-school")
source("code-school/some-script.R")
