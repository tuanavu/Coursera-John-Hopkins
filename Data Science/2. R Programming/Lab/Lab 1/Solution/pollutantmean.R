pollutantmean <- function(directory, pollutant, id = 1:332){
    files_list <- dir(directory, full.names = TRUE)
    data <- data.frame() #Empty data frame
    for(i in id){
        data <- rbind(data, read.csv(files_list[i])) #Bind CSV files in data     
    }
    sulfate<-data[,2]
    nitrate<-data[,3]
    if(pollutant=="sulfate"){
        mean(sulfate,na.rm=TRUE)
    }
    else{
        mean(nitrate,na.rm=TRUE)
    }
}

