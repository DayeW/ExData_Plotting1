#Subset Data
alldatafile <- "./household_power_consumption.txt"
alldata <- read.table(alldatafile, header = T, sep = ";", stringsAsFactors = F, dec = ".")
dataUse <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

#Format data
datetime <- strptime(paste(dataUse$Date, dataUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
dataUse$Global_active_power <- as.numeric(dataUse$Global_active_power)
dataUse$Global_reactive_power <- as.numeric(dataUse$Global_reactive_power)
dataUse$Voltage <- as.numeric(dataUse$Voltage)
submetering1 <- as.numeric(dataUse$Sub_metering_1)
submetering2 <- as.numeric(dataUse$Sub_metering_2)
submetering3 <- as.numeric(dataUse$Sub_metering_3)

#Create plot
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))
plot(datetime, dataUse$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(datetime, dataUse$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, dataUse$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()