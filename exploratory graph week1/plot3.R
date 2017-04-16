datatemp<-read.csv2("/home/aurobindo/Desktop/DataSets/hpc.txt",header=T,stringsAsFactors = F)
datatemp$Date<-as.Date(datatemp$Date,format = "%d/%m/%Y")
str(datatemp)
rows<-which(datatemp$Date>="2007-02-01" & datatemp$Date<="2007-02-02")
datatemp<-datatemp[rows,]
datatemp[,c(3:9)]<-lapply(datatemp[,3:9],as.numeric)
datetime <- paste(as.Date(datatemp$Date), datatemp$Time)
datatemp$Datetime <- as.POSIXct(datetime)
with(datatemp, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
