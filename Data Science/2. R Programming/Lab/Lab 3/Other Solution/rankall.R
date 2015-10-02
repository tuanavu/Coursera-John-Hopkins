rankall <- function(outcome, num = "best") {
    outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    table.data<- data.frame(State = names(tapply(outcome.data$State, outcome.data$State, length)), Freq = tapply(outcome.data$State, outcome.data$State, length))
    rownames(table.data) <- NULL ## convert to number 
    causedeath<-c("heart attack", "heart failure", "pneumonia")
    column<-c(11,17,23)
    Input.data<- data.frame(causedeath, column)
    if(nrow(Input.data[Input.data$causedeath == outcome, ]) == 0)
        stop("invalid outcome")
    name <- character(0)
    for(state in table.data$State) {
        state.data <- outcome.data[outcome.data$State == state, ]
        colNum <- Input.data[Input.data$causedeath == outcome, 2]
        state.data <- state.data[complete.cases(state.data[, colNum]), ]
        state.data <- state.data[order(state.data[, colNum], state.data$Hospital.Name), ]
        if(num == "best")
            rankNum <- 1 else if(num == "worst")
                rankNum <- nrow(state.data) else rankNum <- as.numeric(num)
        name <- c(name, state.data[rankNum, ]$Hospital.Name)
        
    }
    return(data.frame(hospital = name, state = table.data$State))
}


##head(rankall("heart attack", 20), 10)
##tail(rankall("pneumonia", "worst"), 3)
##tail(rankall("heart failure"), 10)
