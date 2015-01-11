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

#start with plot 3
png(".//plot3.png",bg = "transparent")
plot(subDat$DateTime, subDat$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(subDat$DateTime,subDat$Sub_metering_2, col="red")
lines(subDat$DateTime,subDat$Sub_metering_3, col="blue")
legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="", lwd=1, col=c("black", "red", "blue"))
dev.off()