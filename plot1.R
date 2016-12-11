#ExploratoryAnalysisProject2
getwd()
setwd("C://Users//milic//Desktop//DataScientistCourse//ExploratoryAnalysis//exdata%2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#use aggregate expression so I can calculate sum by group(year)
emisstotal<- with(NEI, aggregate(Emissions/1000, by = list(year), sum))

png(filename = "plot1.png")
plot(emisstotal,xlab = "Years",ylab = "PM2.5 Emissions per year (kilotons)", type = "b",pch=17, main = "Total PM2.5 Emissions in USA for specific period", col="red")
dev.off()
