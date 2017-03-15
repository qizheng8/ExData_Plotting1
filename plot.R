#read data into R
f <- file.path(getwd(), "household_power_consumption.txt")
data <- read.table(f, head = T, sep = ';', na.strings = "?")
#choose certain data that we need
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
#add a new column datetime
datetime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(datetime, data)
#draw the first figure
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
#draw the second figure
png(filename = "plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#draw the third figure
png(filename = "plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")
dev.off()
#draw the fourth figure
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$datetime, data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
plot(data$datetime, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(data$datetime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")
plot(data$datetime, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()


