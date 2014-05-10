getdata<-function(){
  #if the data file doesn't exist in the working directory, download it and read it into memory
  d <- {
    if(!file.exists("household_power_consumption.zip")){
      z <- download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
                         ,'household_power_consumption.zip',method='curl')
      unz('household_power_consumption.zip',"household_power_consumption.txt")
      read.table("household_power_consumption.txt",header=T,sep=';')
    }
    else{
      #if it's already there, just read it
      unz('household_power_consumption.zip',"household_power_consumption.txt")
      read.table("household_power_consumption.txt",header=T,sep=';')
    }
  }
  #return the subset of dates we care about
  d[d$Date == '1/2/2007'|d$Date == '2/2/2007',]
}