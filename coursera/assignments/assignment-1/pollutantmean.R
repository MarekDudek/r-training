
print. <- function(..., quote=FALSE) {
    print(paste(...), quote=quote)    
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    if (!pollutant %in% c('sulfate', 'nitrate')) {
        stop(paste('Wrong pollutant: "', pollutant, '"', sep=''))
    }
    
    file.name = '023.csv'
    file.path = paste0(directory, '/', file.name)
    file.data.frame <- read.csv(file.path)
    
    pollutant.vector <- file.data.frame[[pollutant]]
    
    available.values <- pollutant.vector[!is.na(pollutant.vector)]
    mean <- mean(available.values)
    
    mean
}

pm3 <- pollutantmean("specdata", "nitrate", 23)
