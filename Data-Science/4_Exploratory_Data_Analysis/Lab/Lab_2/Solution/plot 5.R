## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland
Maryland <- NEI[NEI$fips == "24510", ]

## Get motor vehicle sources in SCC
onroad <- subset(SCC,Data.Category == "Onroad")
motorCodes <- onroad$SCC

## Subset Data with the code
MarylandData <- subset(Maryland, SCC %in% motorCodes)

## Extract data by calculating the sum of Emissions
MarylandMotor <- aggregate(Emissions~year, MarylandData, sum)

## Plot
with(MarylandMotor, plot(year, Emissions,
                         , xlab = "Year", ylab = "Total Emissions", type="l"
                         , main="Total Emissions for motor vehicle 
                         sources changed in Baltimore City"))

dev.copy(png, file = "plot 5.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!