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
    ordered <- data.in.state[order(as.numeric(data.in.state[, column]), data.in.state$Hospital.Name), ]
    
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
#########################################################################################
#########################################################################################
print('All tests passed', quote=F)
