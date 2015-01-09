
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    if (!pollutant %in% c('sulfate', 'nitrate')) {
        stop(paste0('Wrong pollutant: "', pollutant, '"'))
    }
    
    names <- sprintf('%03d.csv', id)
    paths <- file.path(directory, names)
    
    all.values <- c()
    
    for (path in paths) {
        
        frame <- read.csv(path)
        
        vector <- frame[[pollutant]]
        available <- vector[!is.na(vector)]
        
        all.values <- c(all.values, available)
    }
    
    mean <- mean(all.values)
    mean
}