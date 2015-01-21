
library(testit)

setwd('/home/marek/Education/coursera/data-science/r-training/coursera/assignments/assignment-3')

column.names <- c(
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'
)
names(column.names) <- c('heart attack', 'heart failure', 'pneumonia')

rankall <- function(outcome, num = "best") {
    
    if (! outcome %in% names(column.names)) {
        stop('invalid outcome')
    }
    
    data <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    
    NULL
}

#########################################################################################
## Fourth for heart failure in Texas
#########################################################################################

## When
hospital <- rankall('heart failure', 4)

## Then
assert( is.null(hospital) )
