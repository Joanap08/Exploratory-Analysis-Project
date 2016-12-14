install.packages("ggplot2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Select Baltimore only
mary<-NEI[NEI$fips=="24510",]

#agrregate so we can have the years and types as factors.

balt.agg <- aggregate(mary[c("Emissions")], list(type = mary$type, year = mary$year), sum)

#qplot
png(filename="plot3.png")
qplot(year, Emissions, data = balt.agg, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore by Source ") + xlab("Year") + ylab("PM2.5 Emissions(tons)")  
dev.off()

## trying alternatives still to look better
png(filename="plot3.png")
require(ggplot2)
ggplot(data=baltagg, aes(x=year, y=Emissions, fill=year))+
         geom_bar(stat="identity")+
  geom_text(aes(label=Emissions),color="Black")+
  
  ggtitle("Total PM2.5 Emissions in Baltimore by Source ")+
  xlab("Year")+ 
  ylab("PM2.5 Emissions(tons)")
           
dev.off()
