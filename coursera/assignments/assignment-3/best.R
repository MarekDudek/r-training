
column.names <- c(
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure', 
    'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'
)
names(column.names) <- c('heart attack', 'heart failure', 'pneumonia')

best <- function(state, outcome) {
    
    if (!outcome %in% names(column.names)) {
        stop('invalid outcome')
    }
    
    data <- read.csv('outcome-of-care-measures.csv', colClasses = 'character')
    
    if (! state %in% data$State) {
        stop('invalid state')
    }
    
    data.in.state <- data[data$State == state, ]
    #print(paste('Hospital count in state:', nrow(data.in.state)), quote=F)
    
    column <- column.names[[outcome]]
    #print(paste('Column:', column), quote=F)
    
    row.number <- which.min(data.in.state[, column])
    #print(paste('Row number:', row.number), quote=F)
    
    hospital.with.lowest <- data.in.state[row.number, ]
    #print(paste('Hospital with lowest stat:', hospital.with.lowest), quote=F)
    
    hospital.with.lowest$Hospital.Name
}