source('getdata.R')
#set png device
png('plot3.png')
#read the data
t<-getdata()
#make a new col for date and time
t$date_time <- strptime(paste(t$Date,t$Time),format="%d/%m/%Y%H:%M:%S")
plot(t$date_time,as.numeric(as.character(t$Sub_metering_1)),type='l',xlab="",ylab="Energy sub metering")
lines(t$date_time,as.numeric(as.character(t$Sub_metering_2)),col="red")
lines(t$date_time,as.numeric(as.character(t$Sub_metering_3)),col="blue")
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
#output the pretty picture
dev.off()