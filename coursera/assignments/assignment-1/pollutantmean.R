
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    if (!pollutant %in% c('sulfate', 'nitrate')) {
        stop(paste0('Wrong pollutant: "', pollutant, '"'))
    }
    
    names <- sprintf('%03d.csv', id)
    paths <- file.path(directory, names)
    
    values <- c()
    
    for (path in paths) {
        
        frame <- read.csv(path)
        vector <- frame[[pollutant]]
        
        values <- c(values, vector)
    }
    
    mean(values, na.rm=TRUE)
}