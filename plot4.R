source('getdata.R')
#set png device
png('plot4.png')
#read the data
t<-getdata()
#make a new col for date and time
t$date_time <- strptime(paste(t$Date,t$Time),format="%d/%m/%Y%H:%M:%S")
#two rows of two columns of plots
par(mfrow=c(2,2))
t$Global_active_power<-as.numeric(as.character(t$Global_active_power))
plot(t$date_time,t$Global_active_power,type='l',ylab="Global Active Power",xlab='')
plot(t$date_time,as.numeric(as.character(t$Voltage)),ylab="Voltage",xlab="datetime",type='l')

plot(t$date_time,as.numeric(as.character(t$Sub_metering_1)),type='l',xlab="",ylab="Energy sub metering")
lines(t$date_time,as.numeric(as.character(t$Sub_metering_2)),col="red")
lines(t$date_time,as.numeric(as.character(t$Sub_metering_3)),col="blue")
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1,bty='n')

t$Global_reactive_power<-as.numeric(as.character(t$Global_reactive_power))
plot(t$date_time,t$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power',cex.axis=0.8)
#output the pretty picture
dev.off()