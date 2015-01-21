
library(testit)

setwd('/home/marek/Education/coursera/data-science/r-training/coursera/assignments/assignment-3')

error.message = function(result) {
    
    assert( class(result) == 'try-error' )
    
    attrs <- attributes(result)
    condition <- attrs['condition']
    message <- condition[[1]][[1]]
    
    message
}

#########################################################################################
## There are three possible outcomes: 'heart attack', 'heart failure', or 'pneumonia'.
#########################################################################################

## Given
source('best.R')

## When
hospital <- try( 
    {
        best('AL', 'non existent outcome')
    }
)

## Then
assert( error.message(hospital) == 'invalid outcome' )

#########################################################################################
## State should be valid
#########################################################################################

## Given
source('best.R')

## When
hospital <- try(
    {
        best('Alabama', 'pneumonia')
    }
)

## Then
assert( error.message(hospital) == 'invalid state' )

#########################################################################################
## Best for heart attack in Texas
#########################################################################################

## Given
source('best.R')

## When
hospital <- best('TX', 'heart attack')

## Then
assert( hospital == 'CYPRESS FAIRBANKS MEDICAL CENTER' )

print('All tests passed', quote=F)