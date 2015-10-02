complete <- function(directory, id = 1:332){
    files_list <- dir(directory, full.names = TRUE)
    nobs <- c()
    for (i in id){
        data <- read.csv(files_list[i]) #Bind CSV files in data  
        sum_complete <- sum(complete.cases(data))  
        nobs <- c(nobs, sum_complete)
    }    
    dat <- data.frame(id, nobs)
    dat
}

complete("specdata", 30:25)