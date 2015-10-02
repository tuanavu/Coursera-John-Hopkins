add2 <-function(x, y){
    x + y
}

above10 <- function(x){
    use <- x > 10
    x[use]
}

above <- function(x, n = 10){
    use <- x > n
    x[use]
}

columnmean <- function(y, removeNA = TRUE){
    nc <- ncol(y)
    means <- numeric(nc)
    for(i in 1:nc){
        means[i] <- mean(y[, i], na.rm = removeNA)
    }
    means
}

cube <- function(x, n) {
    x^3
}

f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}

x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}