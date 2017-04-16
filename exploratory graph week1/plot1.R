
datatemp<-read.csv2("/home/aurobindo/Desktop/DataSets/hpc.txt",header=T,stringsAsFactors = F)
datatemp$Date<-as.Date(datatemp$Date,format = "%d/%m/%Y")
str(datatemp)
rows<-which(datatemp$Date>="2007-02-01" & datatemp$Date<="2007-02-02")
datatemp<-datatemp[rows,]
datatemp[,c(3:9)]<-lapply(datatemp[,3:9],as.numeric)
hist(datatemp$Global_active_power,col = "red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
