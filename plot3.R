install.packages("ggplot2")
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Select Baltimore only

mary<-NEI[NEI$fips=="24510",]

#Need to factorize the years so we can use them for the graph
mary$year <- factor(mary$year, levels=c('1999', '2002', '2005', '2008'))


#Initial call to qplot
qplot(year,Emissions, data=mary, facets = .~type, geom="line", ylim=c(0,500))
