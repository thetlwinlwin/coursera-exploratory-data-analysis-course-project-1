power <- read.table('./data/household_power_consumption.txt',header=TRUE,sep = ';')

#subset
data <- subset(power,power$Date=='1/2/2007'|power$Date =="2/2/2007")

#changing format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),'%Y-%m-%d %H:%M:%S')

#plotting
data$DateTime <- as.POSIXct(data$DateTime)
par(mfrow=c(2,2),mar=c(4,4,2,1))
with(data,{
  plot(data$DateTime,data$Global_active_power,type='l',xlab="",ylab="Global Active Power")
  plot(data$DateTime,data$Voltage, type = "l",xlab="datetime",ylab="Voltage")
  plot(data$DateTime,data$Sub_metering_1,type='n',xlab='',ylab="Energy sub metering")
  with(data,lines(DateTime,Sub_metering_1))
  with(data,lines(DateTime,Sub_metering_2),col='red')
  with(data,lines(DateTime,Sub_metering_3),col ='blue')
  legend('topright',lty=1,col=c('black','red','blue'),
         legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         bty='n')
  plot(data$DateTime,data$Global_reactive_power,type = 'l',xlab='datetime',ylab="Global_reactive_power")
})
#saving
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

