
rankall <- function(outcome, num = "best") {
    outcomeDfr <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    suppressWarnings(outcomeDfr[, 11] <- as.numeric(outcomeDfr[, 11]))
    suppressWarnings(outcomeDfr[, 17] <- as.numeric(outcomeDfr[, 17]))
    suppressWarnings(outcomeDfr[, 23] <- as.numeric(outcomeDfr[, 23]))
    tableDfr <- data.frame(State = names(tapply(outcomeDfr$State, outcomeDfr$State, length)), Freq = tapply(outcomeDfr$State, outcomeDfr$State, length))
    rownames(tableDfr) <- NULL
    inputDfr <- data.frame(Outcome = c("heart attack", "heart failure", "pneumonia"), Col = c(11, 17, 23))
    if(nrow(inputDfr[inputDfr$Outcome == outcome, ]) == 0)
        stop("invalid outcome")
    name <- character(0)
    for(state in tableDfr$State) {
        stateDfr <- outcomeDfr[outcomeDfr$State == state, ]
        colNum <- inputDfr[inputDfr$Outcome == outcome, 2]
        stateDfr <- stateDfr[complete.cases(stateDfr[, colNum]), ]
        stateDfr <- stateDfr[order(stateDfr[, colNum], stateDfr$Hospital.Name), ]
        if(num == "best")
            rankNum <- 1 else if(num == "worst")
                rankNum <- nrow(stateDfr) else suppressWarnings(rankNum <- as.numeric(num))
        name <- c(name, stateDfr[rankNum, ]$Hospital.Name)
        
    }
    return(data.frame(hospital = name, state = tableDfr$State))
}


#head(rankall("heart attack", 20), 10)
#tail(rankall("pneumonia", "worst"), 3)
#tail(rankall("heart failure"), 10)

