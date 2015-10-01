data <- read.csv("getdata-data-ss06hid.csv", header=TRUE)

a  <- data[which(data$ACR == "3" & data$AGS == "6"),]

library(jpeg)
jeff <- readJPEG("getdata-jeff.jpg", native = TRUE)
head(jeff)
quantile(jeff, probs = c(0.3, 0.8))

GDP <- read.csv("getdata-data-GDP.csv", header=TRUE)
EDSTATS <- read.csv("getdata-data-EDSTATS_Country.csv", header=TRUE)
head(GDP)
merge <- mergedData <- merge(GDP,EDSTATS, by.x="X", by.y="CountryCode", all=FALSE)
head(merge)
sort