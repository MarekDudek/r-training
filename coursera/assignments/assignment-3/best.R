
column.names <- c(
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'
)
names(column.names) <- c('heart attack', 'heart failure', 'pneumonia')

best <- function(state, outcome) {
    
    data <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    
    if (! state %in% data$State) {
        stop('invalid state')
    }

    if (! outcome %in% names(column.names)) {
        stop('invalid outcome')
    }
    
    data.in.state <- data[data$State == state, ]
    
    column <- column.names[[outcome]]
    numbers <- suppressWarnings(as.numeric(data.in.state[, column]))

    row.numbers <- which(numbers == min(numbers, na.rm=TRUE))
    hospitals.with.lowest.stat <- data.in.state[row.numbers, ]

    min(hospitals.with.lowest.stat$Hospital.Name, na.rm=TRUE)
}