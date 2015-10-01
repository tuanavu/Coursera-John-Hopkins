## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get the coal combustion-related sources from SCC
Codes <- SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE)]

## Subset Data with the code
SCCdata <- subset(NEI, SCC %in% Codes)

## Extract data by calculating the sum of Emissions
sumcoal <- aggregate(Emissions~year, SCCdata, sum)

## Plot
with(sumcoal, plot(year, Emissions,
                   , xlab = "Year", ylab = "Total Emissions", type="l"
                   , main="Total Emissions for 
                   coal combustion-related sources"))

dev.copy(png, file = "plot 4.png") ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!