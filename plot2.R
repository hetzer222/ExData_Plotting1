source('getdata.R')
#set png device
png('plot2.png')
#read the data
t<-getdata()
#make a new col for date and time
t$date_time <- strptime(paste(t$Date,t$Time),format="%d/%m/%Y%H:%M:%S")
#convert to kilowatts
t$Global_active_power<-as.numeric(as.character(t$Global_active_power))
#plot the data
plot(t$date_time,t$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab='')
#output the pretty picture
dev.off()