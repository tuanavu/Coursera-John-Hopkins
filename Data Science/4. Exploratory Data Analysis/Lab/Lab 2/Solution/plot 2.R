## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland
Maryland <- NEI[NEI$fips == "24510", ]

## Extract data by calculating the sum of Emissions
sumMaryland <- aggregate(Emissions~year, Maryland, sum)

## Plot
with(sumMaryland, plot(year, Emissions,
                       , xlab = "Year", ylab = "Total Emissions", type="l"
                       , main="Total Emissions for each year
                       in Baltimore City, Maryland"))

dev.copy(png, file = "plot 2.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!