# Reproducible Research: Peer Assessment 1

## Loading and preprocessing the data

1. Load the data:

```r
data <- read.csv("activity.csv", header=TRUE)
```

2. Show the original data:

```r
head(data)
```

```
##   steps       date interval
## 1    NA 2012-10-01        0
## 2    NA 2012-10-01        5
## 3    NA 2012-10-01       10
## 4    NA 2012-10-01       15
## 5    NA 2012-10-01       20
## 6    NA 2012-10-01       25
```


## What is mean total number of steps taken per day?

For this part of the assignment, you can ignore the missing values in the dataset.

1. Subset the original data to calculate the total number of steps

```r
stepsByDay <- aggregate(steps~date, data, sum)
head(stepsByDay)
```

```
##         date steps
## 1 2012-10-02   126
## 2 2012-10-03 11352
## 3 2012-10-04 12116
## 4 2012-10-05 13294
## 5 2012-10-06 15420
## 6 2012-10-07 11015
```

2. Make a histogram of the total number of steps taken each day

```r
hist(stepsByDay$steps, col = "chocolate"
     , xlab = "Steps", main = "Total Number of Steps Per Day")
```

![plot of chunk histogram1](./PA1_template_files/figure-html/histogram1.png) 

3. Calculate and report the mean and median total number of steps taken per day

```r
mean1 <- mean(stepsByDay$steps)
mean1
```

```
## [1] 10766
```

```r
median1 <- median(stepsByDay$steps)
median1
```

```
## [1] 10765
```
## What is the average daily activity pattern?
1. Subset the original data to calculate the average number of steps taken of the 5-minute interval

```r
averageSteps <- aggregate(steps~interval, data, mean)
head(averageSteps)
```

```
##   interval   steps
## 1        0 1.71698
## 2        5 0.33962
## 3       10 0.13208
## 4       15 0.15094
## 5       20 0.07547
## 6       25 2.09434
```

2. Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

```r
with(averageSteps, plot(interval, steps
                , type="l", main="Average number of steps taken in 5-min interval"
                , col = "blue")) 
```

![plot of chunk plot1](./PA1_template_files/figure-html/plot1.png) 

3. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

Max data is:

```r
max <- max(averageSteps$steps)
max
```

```
## [1] 206.2
```

The interval contains max data is:

```r
subsetData <- subset(averageSteps, steps == max)
subsetData$interval
```

```
## [1] 835
```

## Imputing missing values
Note that there are a number of days/intervals where there are missing values (coded as NA). The presence of missing days may introduce bias into some calculations or summaries of the data.

1. Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)

```r
colSums(is.na(data))
```

```
##    steps     date interval 
##     2304        0        0
```

2. Create a new column "newSteps" contains the average steps in each interval

```r
data$newSteps <- averageSteps$steps
head(data)
```

```
##   steps       date interval newSteps
## 1    NA 2012-10-01        0  1.71698
## 2    NA 2012-10-01        5  0.33962
## 3    NA 2012-10-01       10  0.13208
## 4    NA 2012-10-01       15  0.15094
## 5    NA 2012-10-01       20  0.07547
## 6    NA 2012-10-01       25  2.09434
```

3. Fill in the missing data

```r
data$steps[is.na(data$steps)] <- data$newSteps
```

```
## Warning: number of items to replace is not a multiple of replacement
## length
```

```r
head(data)
```

```
##     steps       date interval newSteps
## 1 1.71698 2012-10-01        0  1.71698
## 2 0.33962 2012-10-01        5  0.33962
## 3 0.13208 2012-10-01       10  0.13208
## 4 0.15094 2012-10-01       15  0.15094
## 5 0.07547 2012-10-01       20  0.07547
## 6 2.09434 2012-10-01       25  2.09434
```

4. Create a new dataset that is equal to the original dataset but with the missing data filled in

```r
data$newSteps <- NULL
newdata <- data
head(newdata)
```

```
##     steps       date interval
## 1 1.71698 2012-10-01        0
## 2 0.33962 2012-10-01        5
## 3 0.13208 2012-10-01       10
## 4 0.15094 2012-10-01       15
## 5 0.07547 2012-10-01       20
## 6 2.09434 2012-10-01       25
```

5. Subset in the new data set to calculate the total number of steps per day

```r
sumdata <- aggregate(steps~date, newdata, sum)
head(sumdata)
```

```
##         date steps
## 1 2012-10-01 10766
## 2 2012-10-02   126
## 3 2012-10-03 11352
## 4 2012-10-04 12116
## 5 2012-10-05 13294
## 6 2012-10-06 15420
```

6. Make a histogram of the total number of steps taken each day

```r
hist(sumdata$steps, col = "blue"
     , xlab = "Steps"
     , main = "Total Number of Steps Per Day (with the missing data filled in)")
```

![plot of chunk histogram2](./PA1_template_files/figure-html/histogram2.png) 

7. Calculate and report the mean and median total number of steps taken per day

```r
mean2 <- mean(sumdata$steps)
mean2
```

```
## [1] 10766
```

```r
median2 <- median(sumdata$steps)
median2
```

```
## [1] 10766
```

8. Calculate the differences of the mean and median between the first and second part

```r
mean2 - mean1
```

```
## [1] 0
```

```r
median2 - median1
```

```
## [1] 1.189
```
## Are there differences in activity patterns between weekdays and weekends?
For this part, I do not use the weekdays() function, instead I use the isWeekday() function from the timeDate package.

1. Install and load the timeDate package

Please install the package first:

install.packages("timeDate")

```r
library(timeDate)
```

```
## Warning: package 'timeDate' was built under R version 3.1.1
```

2. Create a new column, and use the isWeekday() function to check if the date is weekday or weekend

```r
newdata$Weekday <- isWeekday(newdata$date)
head(newdata)
```

```
##     steps       date interval Weekday
## 1 1.71698 2012-10-01        0    TRUE
## 2 0.33962 2012-10-01        5    TRUE
## 3 0.13208 2012-10-01       10    TRUE
## 4 0.15094 2012-10-01       15    TRUE
## 5 0.07547 2012-10-01       20    TRUE
## 6 2.09434 2012-10-01       25    TRUE
```

3. Subset and calculate the average steps for weekday and weekend

Weekday

```r
weekday <- subset(newdata, newdata$Weekday == "TRUE")
weekdayMean <- aggregate(steps ~ interval, data = weekday, mean)
head(weekdayMean)
```

```
##   interval   steps
## 1        0 2.25115
## 2        5 0.44528
## 3       10 0.17317
## 4       15 0.19790
## 5       20 0.09895
## 6       25 1.59036
```

Weekend

```r
weekend <- subset(newdata, newdata$Weekday == "FALSE")
weekendMean <- aggregate(steps ~ interval, data = weekend, mean)
head(weekendMean)
```

```
##   interval    steps
## 1        0 0.214623
## 2        5 0.042453
## 3       10 0.016509
## 4       15 0.018868
## 5       20 0.009434
## 6       25 3.511792
```

4. Make the panel plot to calculate the average number of steps taken for weekday and weekend

```r
layout(matrix(c(1,1,2,2), 2, 2, byrow = TRUE))
plot(weekdayMean$interval, weekdayMean$steps
     , xlab = "interval", ylab = "Number of steps"
     , main ="Weekday", col ="blue", type="l") 

plot(weekendMean$interval, weekendMean$steps
     , xlab = "interval", ylab = "Number of steps"
     , main ="Weekend", col ="red", type="l")
```

![plot of chunk panel](./PA1_template_files/figure-html/panel.png) 
