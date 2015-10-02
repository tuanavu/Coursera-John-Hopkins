## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland and Los Angeles
data<-NEI[with(NEI, fips == "06037"|fips == "24510"), ]

## Get motor vehicle sources in SCC
onroad <- subset(SCC,Data.Category == "Onroad")
motorCodes <- onroad$SCC

## Subset Data with the code
motorData <- subset(data, SCC %in% motorCodes)

## Extract data by calculating the sum of Emissions
Motor <- aggregate(Emissions~year + fips, motorData, sum)

## Load the library
library(ggplot2)

## Plot
g <- ggplot(Motor, aes(year, Emissions))
g + facet_grid(. ~ fips) + geom_line()

dev.copy(png, file = "plot 6.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!