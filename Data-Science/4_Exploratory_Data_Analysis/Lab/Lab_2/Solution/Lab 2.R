NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

sumdata <- aggregate(Emissions~year, NEI, sum)

with(sumdata, plot(year, Emissions,
                , xlab = "Year", ylab = "Total Emissions", type="l"
                , main="Total Emissions for each year"))

Maryland <- NEI[NEI$fips == "24510", ]
sumMaryland <- aggregate(Emissions~year, Maryland, sum)

with(sumMaryland, plot(year, Emissions,
                   , xlab = "Year", ylab = "Total Emissions", type="l"
                   , main="Total Emissions for each year in Baltimore City, Maryland"))

#library(plyr)
#ddply(site3, .(type,year), summarise, mean=mean(Emissions))

# tapply(baltimore$Emissions, list(baltimore$year, baltimore$type), sum

library(ggplot2)
typeMaryland <- aggregate(Emissions~year + type, Maryland, sum)

##qplot(year, Emissions, data = typeMaryland, geom = "smooth", method ="lm", facets = .~ type)

g <- ggplot(typeMaryland, aes(year, Emissions))
g + facet_grid(. ~ type) + geom_line()


Codes <- SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE)]
SCCdata <- subset(NEI, SCC %in% Codes)
head(SCCdata)

sumcoal <- aggregate(Emissions~year, SCCdata, sum)
with(sumcoal, plot(year, Emissions,
                       , xlab = "Year", ylab = "Total Emissions", type="l"
                       , main="Total Emissions for coal combustion-related sources"))

Maryland <- NEI[NEI$fips == "24510", ]
onroad <- subset(SCC,Data.Category == "Onroad")
motorCodes <- onroad$SCC

MarylandData <- subset(Maryland, SCC %in% motorCodes)

MarylandMotor <- aggregate(Emissions~year, MarylandData, sum)
with(MarylandMotor, plot(year, Emissions,
                   , xlab = "Year", ylab = "Total Emissions", type="l"
                   , main="Total Emissions for  motor vehicle sources changed from 1999-2008 in Baltimore City"))

data<-NEI[with(NEI, fips == "06037"|fips == "24510"), ]
motorData <- subset(data, SCC %in% motorCodes)
Motor <- aggregate(Emissions~year + fips, motorData, sum)

library(ggplot2)
g <- ggplot(Motor, aes(year, Emissions))
g + facet_grid(. ~ fips) + geom_line()
