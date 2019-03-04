data<-read.table("data.txt")
data$V1<-as.character(data$V1)
final<-data[data$V1=="1/2/2007"|data$V1=="2/2/2007",]
colnames(final)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering_3")
final$Global_active_power<-as.numeric(as.character(final$Global_active_power))
png("plot1.png")
hist(final$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()