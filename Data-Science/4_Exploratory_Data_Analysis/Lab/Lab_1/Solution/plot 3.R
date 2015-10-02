## Reading the data
dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## Extract data from the dates 2007-02-01 and 2007-02-02
data<-dat[with(dat, Date=="1/2/2007"|Date=="2/2/2007"), ]

##Change date, time format
dateTime <- strptime( paste(data$Date,data$Time), format= "%d/%m/%Y %H:%M:%S")

##Create a png file
png('plot 3.png')

##Plot
with(data, {
    plot(dateTime, Sub_metering_1
                , xlab = "", ylab = "Energy sub metering", type="l")
    lines(dateTime, Sub_metering_2,col="red")
    lines(dateTime, Sub_metering_3,col="blue")
    }) 

legend("topright", lty= 1, col = c("black", "red", "blue"),        
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 

dev.off() ## Close the PNG device!