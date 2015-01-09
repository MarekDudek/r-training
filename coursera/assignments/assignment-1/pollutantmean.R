
print. <- function(..., quote=FALSE) {
    print(paste(...), quote=quote)    
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    if (!pollutant %in% c('sulfate', 'nitrate')) {
        stop(paste('Wrong pollutant: "', pollutant, '"', sep=''))
    }
    
    file.names = sprintf("%03d.csv", id)
    file.paths = file.path(directory, file.names)
    
    for (file.path in file.paths) {
        data.frame <- read.csv(file.path)
        
        pollutant.vector <- data.frame[[pollutant]]
        available.values <- pollutant.vector[!is.na(pollutant.vector)]
        
        mean <- mean(available.values)
        return(mean)
    }
}

pm3 <- pollutantmean("specdata", "nitrate", 23)
pm2 <- pollutantmean("specdata", "nitrate", 70:72)

