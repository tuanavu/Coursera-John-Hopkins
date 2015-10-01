
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
    outcomeDataSet <- outcomedata[which(outcomedata$State==state),]
    is_a_state <- is.element(state,outcomedata[,"State"])
    if(!(is_a_state)){
        stop ("invalid state")
    }else{
        if (outcome=="heart attack") {
            a <- outcomeDataSet[[11]]
        }   
        else if (outcome=="heart failure") {
            a <- outcomeDataSet[[17]]
        } 
        else if (outcome=="pneumonia") {
            a <- outcomeDataSet[[23]]
        } 
         
        else{
            stop ("invalid outcome")
        }        
    }
    b <- as.numeric(a)
    if (num == "best") {m <- min(b,na.rm=TRUE)
                        pos <- match(m,a)}
    if (num == "worst") {m <- max(b,na.rm=TRUE)
                         pos <-match(m,a)}
    else {
        pos <- match((sort(b)[num]),a)
    }
    hospitalName <- outcomeDataSet[[2]][pos]
    hospitalName
    
}

#rankhospital("TX", "heart failure", 4)
#rankhospital("MD", "heart attack", "worst")
#rankhospital("MN", "heart attack", 5000)
#rankhospital("NC", "heart attack", "worst")
