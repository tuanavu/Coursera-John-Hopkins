## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland
Maryland <- NEI[NEI$fips == "24510", ]

## Extract data by calculating the sum of Emissions
typeMaryland <- aggregate(Emissions~year + type, Maryland, sum)

## load the library
library(ggplot2)

## Plot
g <- ggplot(typeMaryland, aes(year, Emissions))
g + facet_grid(. ~ type) + geom_line()

dev.copy(png, file = "plot 3.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!