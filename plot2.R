getwd
setwd("C://Users//jpinto//Dropbox//Exploratory//exdata%2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Second Plot
#Aim: Total Emmissions from all sources, fort fips00"24510") From 1999 to 2008

mary<-NEI[NEI$fips=="24510",]

mary99<-mary[mary$year==1999,]
mary02<-mary[mary$year==2002,]
mary05<-mary[mary$year==2005,]
mary08<-mary[mary$year==2008,]

total99<-sum(mary99$Emissions)
total02<-sum(mary02$Emissions)
total05<-sum(mary05$Emissions)
total08<-sum(mary08$Emissions)

totalyears<-c(total99,total02,total05,total08)

years<-c("1999","2002","2005","2008")

#Plot 
png(file= "plot2.png", width=480, height=480)
plot(years,totalyears,xlab = "Period (years)",ylab = "Total PM2.5 Emmissions(tons)", type = "b", pch=16, main = "Total PM2.5 Emmissions for Baltimore City for each year")
dev.off()
