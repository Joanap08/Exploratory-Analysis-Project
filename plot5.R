#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
getwd()
setwd("C://Users//milic//Desktop//DataScientistCourse//ExploratoryAnalysis//exdata%2Fdata%2FNEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor<- grepl("Vehicle", SCC$EI.Sector)
extract1<-SCC[motor,]

baltimore<-NEI[NEI$fips=="24510",]
#merge both datasets based on SCC
both1<-baltimore[baltimore$SCC %in% extract1$SCC,]

#we can work again with total emission amounts
motorsources<-summarise(group_by(both1,year), Emissions=sum(Emissions))

#plot as line since it is more clear the changes among years
png(filename = "plot5.png")
ggplot(motorsources,aes(x=factor(year), y=Emissions, group=1, label=round(Emissions,2)))+
  geom_line(color="light blue",size= 1.5)+
  geom_point(shape=23, fill="blue",size=3)+
  geom_text(colour = "black", fontface = "italic", hjust=0.5, vjust=1.5)+
  xlab("Year")+
  ylab("PM2.5 Motor vehicle sources emissions(tons)") +
  ggtitle("Emissions from motor vehicle-related sources in Baltimore City")
dev.off()
