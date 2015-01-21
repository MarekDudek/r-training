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
    
    if (! state %in% data$State) {
        stop('invalid state')
    }
    
    if (! outcome %in% names(column.names)) {
        stop('invalid outcome')
    }
    
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
error.message = function(result) {
    
    assert( class(result) == 'try-error' )
    
    attrs <- attributes(result)
    condition <- attrs['condition']
    message <- condition[[1]][[1]]
    
    message
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
## Submission case 4
#########################################################################################

## When
hospital <- rankhospital("NC", "heart attack", "worst")

## Then
assert( hospital == 'WAYNE MEMORIAL HOSPITAL' )

#########################################################################################
## Submission case 5
#########################################################################################

## When
hospital <- rankhospital("WA", "heart attack", 7)

## Then
assert( hospital == 'YAKIMA VALLEY MEMORIAL HOSPITAL' )

#########################################################################################
## Submission case 6
#########################################################################################

## When
hospital <- rankhospital("WA", "pneumonia", 1000)

## Then
assert( is.na(hospital) )

#########################################################################################
## Submission case 7
#########################################################################################

## When
hospital <- try(rankhospital("NY", "heart attak", 7))

## Then
assert( error.message(hospital) == 'invalid outcome' )

#########################################################################################
#########################################################################################
#########################################################################################
print('All tests passed', quote=F)
