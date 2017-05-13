#Subset Data
alldatafile <- "./household_power_consumption.txt"
alldata <- read.table(alldatafile, header = T, sep = ";", stringsAsFactors = F, dec = ".")
dataUse <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

#Format data
datetime <- strptime(paste(dataUse$Date, dataUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(dataUse$Sub_metering_1)
submetering2 <- as.numeric(dataUse$Sub_metering_2)
submetering3 <- as.numeric(dataUse$Sub_metering_3)

#plot
png("plot3.png", width = 480, height = 480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()