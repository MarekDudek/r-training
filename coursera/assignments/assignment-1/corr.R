
corr <- function(directory, threshold = 0) {

    correlations <- c()
    
    ids <- 1:332
    
    for (id in ids) {
        
        name <- sprintf('%03d.csv', id)
        path <- file.path(directory, name)
        
        frame <- read.csv(path)
        
        nitrate <- frame$nitrate
        sulfate <- frame$sulfate
        
        complete       <- complete.cases(nitrate, sulfate)
        complete.count <- length(complete[complete])
        
        if (complete.count > threshold) {
            cor <- cor(nitrate[complete], sulfate[complete])
            correlations <- c(correlations, cor)
        }
    }
    
    correlations
}