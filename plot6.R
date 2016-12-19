#Compare emissions from motor vehicle sources in Baltimore City with LA (fips=="06037")?
#Which city has seen greater changes over time in motor vehicle emissions
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Finding the motor vehicle related
motor<- grepl("Vehicle", SCC$EI.Sector)
extract1<-SCC[motor,]

#Baltimore Vehicle sources
baltimore<-NEI[NEI$fips=="24510",]
both1<-baltimore[baltimore$SCC %in% extract1$SCC,]


#LA Vehicle sources
la<-NEI[NEI$fips == "06037",]
both2<-la[la$SCC %in% extract1$SCC,]


#Summarize the sources to obtain the total emissions Baltimore
mosobalt<-summarise(group_by(both1,year), Emissions=sum(Emissions))
mosobalt$city<-c("Baltimore")
#Summarize the sources to obtain the total emissions LA
mosola<-summarise(group_by(both2,year), Emissions=sum(Emissions))
mosola$city<-c("LA")

#merge the cities
alldata<-rbind(mosola,mosobalt)

#plot the both cities
png(filename = "plot6.png")
ggplot(alldata, aes(x=factor(year), y=Emissions, group=city,label = round(Emissions,2))) +
  geom_line(color="light blue",size= 1.5) + 
  geom_point(shape=23, fill="blue",size=3)+
  facet_grid(city~., scales="free_y") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  xlab("Year") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
  geom_label(aes(fill = city),colour = "white", fontface = "plain")
dev.off()
