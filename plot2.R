library(dplyr)
data<-read.table("data.txt",sep=";")
data$V1<-as.character(data$V1)
final<-data[data$V1=="1/2/2007"|data$V1=="2/2/2007",]
colnames(final)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering_3")
final$Global_active_power<-as.numeric(as.character(final$Global_active_power))
final$Date<-as.Date(final$Date,"%d/%m/%Y")
final<-mutate(final,Actual=paste(Date,Time))
final$Actual<-strptime(final$Actual,format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
par(mar=c(3,4,4,4))
plot(final$Actual,final$Global_active_power,ylab="Global Active Power (kilowatts)",type="l")
dev.off()