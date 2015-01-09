
complete <- function(directory, id = 1:332) {
    
    ids  <- c()
    nobs <- c()
    
    for (i in id) {

        name <- sprintf('%03d.csv', i)
        path <- file.path(directory, name)
        
        frame <- read.csv(path)
        
        nitrate <- frame$nitrate
        sulfate <- frame$sulfate
        
        complete       <- complete.cases(nitrate, sulfate)
        complete.count <- length(complete[complete])
        
        ids  <- c(ids, i)
        nobs <- c(nobs, complete.count)
    }
    
    data.frame(id=ids, nobs=nobs)
}