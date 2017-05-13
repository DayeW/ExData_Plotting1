#Subset Data
alldatafile <- "./household_power_consumption.txt"
alldata <- read.table(alldatafile, header = T, sep = ";", stringsAsFactors = F, dec = ".")
dataUse <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))
dataUse$Global_active_power <- as.numeric(dataUse$Global_active_power)

#Create plot
png("plot1.png", width = 480, height = 480)
hist(dataUse$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()