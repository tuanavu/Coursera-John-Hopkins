fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "lab.csv")

## Question 1
data <- read.table("./lab.csv", sep = ",", header = TRUE)
x <- data[!is.na(data$VAL),]
a <- x[["VAL"]]
sum(a >= 24)

## Question 3
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./lab2.xlsx", sheetIndex = 1, colIndex = colIndex,
                   rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T) 

## Question 5
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "lab3.csv")
DT <- fread("lab3.csv")

start.time <- Sys.time()

system.time(fread("lab3.csv"))
system.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
DT[,mean(pwgtp15),by=SEX]
mean(DT$pwgtp15,by=DT$SEX)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
tapply(DT$pwgtp15,DT$SEX,mean)

end.time <- Sys.time()
time.taken <- start.time - end.time
time.taken