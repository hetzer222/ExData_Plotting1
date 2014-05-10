source('getdata.R')
#set png device
png('plot1.png')
#read the data
t<-getdata()
#make the histogram
with(t,hist(as.numeric(as.character(Global_active_power)),
            col='red',
            xlab='Global Active Power (kilowatts)',
            main='Global Active Power'))
#output the pretty picture
dev.off()