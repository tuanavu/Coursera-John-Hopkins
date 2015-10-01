## Reading the data
dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## Extract data from the dates 2007-02-01 and 2007-02-02
data<-dat[with(dat, Date=="1/2/2007"|Date=="2/2/2007"), ]

##Change date, time format
dateTime <- strptime( paste(data$Date,data$Time), format= "%d/%m/%Y %H:%M:%S")

##Create a png
png('plot 4.png')

##Plot
par(mfrow = c(2, 2))

with(data, {
    plot(dateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type="l")
    plot(dateTime, Voltage, ylab = "voltage", type="l")
    plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")
    lines (x= dateTime, y= Sub_metering_2, col ="red")
    lines (x= dateTime, y= Sub_metering_3, col ="blue")
    legend("topright", col = c("black", "red", "blue")
           , lty= "solid", bty ="N"
           , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(dateTime, Global_reactive_power, type="l")
    }) 

dev.off() ## Close the PNG device!
