## Reading data from the dates 2007-02-01 and 2007-02-02
data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';'
                   ,as.is=F,na.strings=c('?'),stringsAsFactors=F)
##Name the column
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
head(data)

##Plot
hist(data$Global_active_power, col = "chocolate"
     , xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.copy(png, file = "plot 1.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!



