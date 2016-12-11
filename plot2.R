getwd()
setwd("C://Users//milic//Desktop//DataScientistCourse//ExploratoryAnalysis//exdata%2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#only for baltimore city

mary<-NEI[NEI$fips=="24510",]
#use aggregate expression so I can calculate sum by group(year)
emisstotal<- with(mary, aggregate(Emissions/1000, by = list(year), sum))

#plot
png(filename = "plot2.png")
plot(emisstotal,xlab = "Years",ylab = "PM2.5 Emissions (kilotons)", type = "b",pch=17, main = "Total PM2.5 Emissions in USA in Baltimore City accross time", col="darkblue")
dev.off()
