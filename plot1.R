power <- read.table('./data/household_power_consumption.txt',header=TRUE,sep = ';')

#subset
data <- subset(power,power$Date=='1/2/2007'|power$Date =="2/2/2007")

#changing format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),'%Y-%m-%d %H:%M:%S')

#plotting
hist(as.numeric(as.character(data$Global_active_power)),
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylim = c(0,1200),
     col = 'red')

#saving
dev.copy(png,file='plot1.png', height = 480, width = 480)
dev.off()