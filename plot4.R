getwd()
setwd("C://Users//milic//Desktop//DataScientistCourse//ExploratoryAnalysis//exdata%2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#First select from SCC all the combustion coal related sources
coal<- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
extract<-SCC[coal,]
#merge both datasets based on SCC
both<-NEI[NEI$SCC %in% extract$SCC,]

#try to summarize variables to have the total
sources<-summarise(group_by(both,year), Emissions=sum(Emissions))
#plot
png(filename = "plot4.png")
ggplot(sources,aes(x=factor(year), y=Emissions/1000, group=1, label=round(Emissions/1000,2)))+
  geom_line(color="light blue",size= 1.5)+
  geom_point(shape=23, fill="blue",size=3)+
  geom_text(aes(fill = year),colour = "black", fontface = "italic",vjust = -0.6, nudge_y = 0.5)+
  xlab("Year")+
  ylab("PM2.5 Coal combustion-sources emissions(kilotons)") +
  ggtitle("Emissions from coal combustion-related sources in USA")
dev.off()
