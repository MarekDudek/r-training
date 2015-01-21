library(testit)

setwd('/home/marek/Education/coursera/data-science/r-training/coursera/assignments/assignment-3')

column.names <- c(
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'
)
names(column.names) <- c('heart attack', 'heart failure', 'pneumonia')

rankhospital <- function(state, outcome, num = 'best') {

    data <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    
    data.in.state <- data[data$State == state, ]
    
    column <- column.names[[outcome]]
    numbers <- suppressWarnings( as.numeric(data.in.state[, column]) )
    
    ordered <- data.in.state[order(numbers, data.in.state$Hospital.Name), ]
    
    if (num == 'best') {
        num <- 1
    } else if (num == 'worst') {
        available <- numbers[!is.na(numbers)]
        num <- length(available)
    }
    
    hospital <- ordered[num, ]
    
    name <- hospital$Hospital.Name
    name
}

#########################################################################################
## Fourth for heart failure in Texas
#########################################################################################

## When
hospital <- rankhospital('TX', 'heart failure', 4)

## Then
assert( hospital == 'DETAR HOSPITAL NAVARRO' )

#########################################################################################
## Best for heart failure in Texas
#########################################################################################

## When
hospital <- rankhospital('TX', 'heart failure', 'best')

## Then
assert( hospital == 'FORT DUNCAN MEDICAL CENTER' )

#########################################################################################
## Worst for heart attack in Maryland
#########################################################################################

## When
hospital <- rankhospital('MD', 'heart attack', 'worst')

## Then
assert( hospital == 'HARFORD MEMORIAL HOSPITAL' )

#########################################################################################
## Too low rank for heart attack in Maryland
#########################################################################################

## When
hospital <- rankhospital('MD', 'heart attack', 5000)

## Then
assert( is.na(hospital) )

#########################################################################################
#########################################################################################
#########################################################################################
print('All tests passed', quote=F)
