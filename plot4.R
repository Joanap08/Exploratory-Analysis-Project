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
coal<- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

#merge both datasets based on SCC
both<-merge(x=NEI,y=coal,by='SCC')
