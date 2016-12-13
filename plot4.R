getwd()
setwd("C://Users//milic//Desktop//DataScientistCourse//ExploratoryAnalysis//exdata%2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#First select from SCC all the coal related sources
coal<- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
extract<-SCC[coal,]
#merge both datasets based on SCC
both<-NEI[NEI$SCC %in% extract$SCC,]

#try to summarize variables to have the total
sources<-summarise(group_by(both,year), Emissions=sum(Emissions))
#plot
ggplot(data=sources,aes(x=factor(year), y=Emissions/1000)+ geom_bar(aes(fill=cond2),stat="identity",position = 'dodge')))+ xlab("Period (years)")+ylab("Total PM2.5 Emissions (kilotons)")+ggtitle("Coal Emissions over a certain period in USA")

