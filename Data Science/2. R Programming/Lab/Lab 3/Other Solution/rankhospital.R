
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    requiredata <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings= "Not Available")
    causedeath <- requiredata[which(requiredata$State==state),]
    state_test <- is.element(state,requiredata[,"State"])
    ## check valid data
    if(!(state_test)){
        stop ("invalid state")
    }else{
        if (outcome=="heart attack") {
            a <- causedeath[[11]]
        }   
        else if (outcome=="heart failure") {
            a <- causedeath[[17]]
        } 
        else if (outcome=="pneumonia") {
            a <- causedeath[[23]]
        } 
         
        else{
            stop ("invalid outcome")
        }        
    }
    ## best or worst depend on max or min 
    
    b <- as.numeric(a)
    if (num == "best") {m <- min(b,na.rm=TRUE)## find min without na values
                        p <- match(m,a)}
    if (num == "worst") {m <- max(b,na.rm=TRUE)## find max without na values
                        p <-match(m,a)}
    else {
        p <- match((sort(b)[num]),a)
    }
    NameHospital <- causedeath[[2]][p]
    NameHospital
    
}

##rankhospital("NC", "heart attack", "worst")
##rankhospital("WA", "heart attack", 7)
##rankhospital("MN", "heart attack", 1000)
