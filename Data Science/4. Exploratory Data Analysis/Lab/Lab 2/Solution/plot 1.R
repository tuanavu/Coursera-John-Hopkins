## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract data by calculating the sum of Emissions
sumdata <- aggregate(Emissions~year, NEI, sum)

## Plot
with(sumdata, plot(year, Emissions,
                   , xlab = "Year", ylab = "Total Emissions", type="l"
                   , main="Total Emissions for each year"))

dev.copy(png, file = "plot 1.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!