#Subset Data
alldatafile <- "./household_power_consumption.txt"
alldata <- read.table(alldatafile, header = T, sep = ";", stringsAsFactors = F, dec = ".")
dataUse <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))

#Format data
datetime <- strptime(paste(dataUse$Date, dataUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
dataUse$Global_active_power <- as.numeric(dataUse$Global_active_power)

#Create plot
png("plot2.png", width = 480, height = 480)
plot(datetime, dataUse$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()