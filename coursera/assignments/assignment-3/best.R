
best <- function(state, outcome) {
    
    if (!outcome %in% c('heart attack', 'heart failure', 'pneumonia')) {
        stop('invalid outcome')
    }
    
    outcome <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    
    states <- outcome[, 'State']
    if (! state %in% states) {
        stop('invalid state')
    }
    print(states)
    
    NULL
}