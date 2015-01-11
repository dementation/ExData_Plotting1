setwd(getwd())
data<-read.table(".//household_power_consumption.txt", sep=";", header=TRUE)
##format into date
DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data<-cbind(data, DateTime) 
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
##subset the data
subDat<-data.frame()
subDat<-rbind(data[which(data$Date=="2007-02-01"),])
subDat<-rbind(subDat,data[which(data$Date=="2007-02-02"),])
#lapply to get numneric data
subDat[,3:9]<-lapply(subDat[,3:9], function(x)as.numeric(as.character(x)))

#plot histogramm (plot 1)
png(".//plot1.png",bg = "transparent")
hist(subDat$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()