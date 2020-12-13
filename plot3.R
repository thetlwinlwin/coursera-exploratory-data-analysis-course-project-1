power <- read.table('./data/household_power_consumption.txt',header=TRUE,sep = ';')

#subset
data <- subset(power,power$Date=='1/2/2007'|power$Date =="2/2/2007")

#changing format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),'%Y-%m-%d %H:%M:%S')

#plotting
plot(data$Sub_metering_1 ~ as.POSIXct(data$DateTime),
     type = 'l',
     ylab = 'Energy sub metering',
     xlab ='')
lines(data$Sub_metering_2~as.POSIXct(data$DateTime),col='red')
lines(data$Sub_metering_3~as.POSIXct(data$DateTime),col='blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       cex = 0.8,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saving
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()