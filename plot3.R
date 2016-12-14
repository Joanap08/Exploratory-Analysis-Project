install.packages("ggplot2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Select Baltimore only
mary<-NEI[NEI$fips=="24510",]

#agrregate so we can have the years and types as factors.

balt.agg <- aggregate(mary[c("Emissions")], list(type = mary$type, year = mary$year), sum)

#ggplot
png(filename="plot3.png")
ggplot(balt.agg, aes(x=year,y=Emissions))+geom_point(aes(shape=factor(type),colour=factor(type),size=4))+ggtitle("Total PM2.5 Emissions in Baltimore by Source ")+ xlab("Year") + ylab("PM2.5 Emissions(tons)")
dev.off()
