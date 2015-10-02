# Reproducible Research: Peer Assessment 1

## Loading and preprocessing the data
data <- read.csv("activity.csv", header=TRUE)

# 1. Subset the original data to calculate the total number of steps
stepsByDay <- aggregate(steps~date, data, sum)
head(stepsByDay)

# 2. Make a histogram of the total number of steps taken each day
hist(stepsByDay$steps, col = "chocolate"
     , xlab = "Steps", main = "Total Number of Steps Per Day")

# 3. Calculate and report the mean and median total number of steps taken per day
mean1 <- mean(stepsByDay$steps)
mean1
median1 <- median(stepsByDay$steps)
median1

## What is the average daily activity pattern?

#1. Subset the original data to calculate the average number of steps taken of the 5-minute interval
averageSteps <- aggregate(steps~interval, data, mean)
head(averageSteps)

#2. Make a time series plot
with(averageSteps, plot(interval, steps
                , type="l", main="Average number of steps taken in 5-min interval"
                , col = "blue")) 

#Max data is:
max <- max(averageSteps$steps)
max

#The interval contains max data is:
subsetData <- subset(averageSteps, steps == max)
subsetData
subsetData$interval

## Imputing missing values
#1. Calculate and report the total number of missing values
colSums(is.na(data))

#2. Create a new column "newSteps"
data$newSteps <- averageSteps$steps
head(data)

#3. Fill in the missing data
data$steps[is.na(data$steps)] <- data$newSteps

#4. Create a new dataset
data$newSteps <- NULL
newdata <- data
head(newdata)

#5. Subset in the new data set to calculate the total number of steps per day
sumdata <- aggregate(steps~date, newdata, sum)
head(sumdata)

#6. Make a histogram
hist(sumdata$steps, col = "blue"
     , xlab = "Steps"
     , main = "Total Number of Steps Per Day (with the missing data filled in)")

#7. Calculate and report the mean and median
mean2 <- mean(sumdata$steps)
mean2
median2 <- median(sumdata$steps)
median2

#8. Calculate the differences
mean2 - mean1
median2 - median1

## Are there differences in activity patterns between weekdays and weekends?
#load the timeDate package
# install.packages("timeDate")
library(timeDate)

#2. Create a new column, and use the isWeekday() function to check if the date is weekday or weekend
newdata$Weekday <- isWeekday(newdata$date)
head(newdata)

#3. Subset and calculate the average steps for weekday and weekend
weekday <- subset(newdata, newdata$Weekday == "TRUE")
weekdayMean <- aggregate(steps ~ interval, data = weekday, mean)
head(weekdayMean)

weekend <- subset(newdata, newdata$Weekday == "FALSE")
weekendMean <- aggregate(steps ~ interval, data = weekend, mean)
head(weekendMean)

#4. Make the panel plot to calculate the average number of steps taken for weekday and weekend
layout(matrix(c(1,1,2,2), 2, 2, byrow = TRUE))
plot(weekdayMean$interval, weekdayMean$steps
     , xlab = "interval", ylab = "Number of steps"
     , main ="Weekday", col ="blue", type="l") 

plot(weekendMean$interval, weekendMean$steps
     , xlab = "interval", ylab = "Number of steps"
     , main ="Weekend", col ="red", type="l")

#library(knitr)
#library(markdown)
#knit("Foo.Rmd")
#markdownToHTML("Foo.md", "Foo.html")

