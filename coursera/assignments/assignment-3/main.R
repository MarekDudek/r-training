
library(testit)

setwd('/home/marek/Education/coursera/data-science/r-training/coursera/assignments/assignment-3')

outcome <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')

column.names <- names(outcome)

thirty.day.death.rates.from.heart.attack <- outcome[, 'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack']
#hist(as.numeric(thirty.day.death.rates.from.heart.attack))


source('best.R')


# There are three possible outcomes: 'heart attack', 'heart failure', or 'pneumonia'.

error.message = function(result) {
    
    assert( class(result) == 'try-error' )
    
    attrs <- attributes(result)
    condition <- attrs['condition']
    message <- condition[[1]][[1]]
    
    message
}

best <- try( 
    {
        best('New York', 'non existent outcome')
    }
)

assert( error.message(best) == 'invalid outcome' )















print('All tests passed', quote=F)