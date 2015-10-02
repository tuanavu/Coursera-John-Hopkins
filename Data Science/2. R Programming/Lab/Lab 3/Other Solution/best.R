best <- function(state, outcome) {
  causedeath<- c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% causedeath == FALSE ) stop("invalid outcome")
  
    ## Read outcome data
    requiredata<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
    ##Check that state and outcome are valid
      

    requiredata<- requiredata[c(2, 7, 11, 17, 23)]
    names(requiredata)[1:5] <- c("name","state","heart attack", "heart failure", "pneumonia")
    namestate <- requiredata[, 2]
    namestate <- unique(namestate)
    if( state %in% namestate == FALSE ) stop("invalid state")

    ## Return hospital name in that state with lowest 30-day death rate

    requiredata <- requiredata[requiredata$state==state &requiredata[outcome] != 'Not Available', ]
    vals <- requiredata[, outcome]
    rowNum <- which.min(vals)
    requiredata[rowNum, ]$name
}
# best("BB", "heart attack")
# best("NY", "hert attack")
# best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
