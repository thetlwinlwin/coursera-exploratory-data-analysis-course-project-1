power <- read.table('./data/household_power_consumption.txt',header=TRUE,sep = ';')

#subset
data <- subset(power,power$Date=='1/2/2007'|power$Date =="2/2/2007")

#changing format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),'%Y-%m-%d %H:%M:%S')

#plotting
plot(data$Global_active_power ~ as.POSIXct(data$DateTime),
     type = "l",
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')

#saving
dev.copy(png,file='plot2.png', height = 480, width = 480)
dev.off()
