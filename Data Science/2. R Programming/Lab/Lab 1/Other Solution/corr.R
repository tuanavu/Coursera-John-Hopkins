corr <- function(directory, threshold = 0) {
    files_list <- dir(directory, full.names = TRUE)
    output <- numeric()
    for (i in files_list){
        corval <- 0        
        data <- read.csv(i) #Bind CSV files in data 
        value <- sum(complete.cases(data))
        data <- data[complete.cases(data),]
        if (value > threshold){ 
            sulfate <- data[["sulfate"]]
            nitrate <- data[["nitrate"]]
            corval <- cor(nitrate,sulfate,use="pairwise.complete.obs")            
            output <- c(output,corval)
        }
    }
output

}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
