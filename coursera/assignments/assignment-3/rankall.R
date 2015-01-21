
library(testit)

setwd('/home/marek/Education/coursera/data-science/r-training/coursera/assignments/assignment-3')
source('rankhospital.R')

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
    data.by.state <- split(data, data$State)
    
    hospitals <- c()
    states    <- c()
    
    for (state in names(data.by.state)) {
        
        states    <- c(states, state)
        
        hospital  <- rankhospital(state, outcome, num)
        hospitals <- c(hospitals, hospital)
    }
    
    data.frame(hospital=hospitals, state=states)
}

#########################################################################################
results.the.same <- function(df1, df2) {
    
    # Compare states
    states1 <- as.vector(df1$state)
    states2 <- as.vector(df2$state)
    states.equal <- states1 == states2
    if (!all(states.equal)) {
        return(FALSE)
    }

    hospitals1 <- as.vector(df1$hospital)
    hospitals2 <- as.vector(df2$hospital)
    
    # Compare not available hospitals
    hospitals1.na <- is.na(hospitals1)
    hospitals2.na <- is.na(hospitals2)
    na.equal <- hospitals1.na == hospitals2.na
    if (!all(na.equal)) {
        return(FALSE)
    }

    # Compare available hospitals
    hospitals1.a <- hospitals1[!hospitals1.na]
    hospitals2.a <- hospitals2[!hospitals2.na]
    a.equal <- hospitals1.a == hospitals2.a
    if (!all(a.equal)) {
        return(FALSE)
    }
    
    TRUE
}
#########################################################################################
hospitals.20.heart.attack <- c(
    NA, 
    'D W MCMILLAN MEMORIAL HOSPITAL', 
    'ARKANSAS METHODIST MEDICAL CENTER',
    'JOHN C LINCOLN DEER VALLEY HOSPITAL',
    'SHERMAN OAKS HOSPITAL',
    'SKY RIDGE MEDICAL CENTER',
    'MIDSTATE MEDICAL CENTER',
    NA,
    NA,
    'SOUTH FLORIDA BAPTIST HOSPITAL'
)
states.top.10 <- c('AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL')

hospitals.3.pneumonia <- c(
    'MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC',
    'PLATEAU MEDICAL CENTER',
    'NORTH BIG HORN HOSPITAL DISTRICT'
)
states.bottom.3 <- c('WI', 'WV', 'WY')

#########################################################################################
## Twentieths for heart failure
#########################################################################################

## When
hospitals <- rankall('heart attack', 20)

## Then
df <- data.frame(hospital=hospitals.20.heart.attack, state=states.top.10)
assert( results.the.same(head(hospitals, 10), df) )

#########################################################################################
## Worst for pneumonia
#########################################################################################

## When
hospitals <- rankall('pneumonia', 'worst')

## Then
df <- data.frame(hospital=hospitals.3.pneumonia, state=states.bottom.3)
assert( results.the.same(tail(hospitals, 3), df) )

#########################################################################################
#########################################################################################
#########################################################################################
print('All tests passed', quote=F)

