# Plot3 - Sub_metering plot
# read in dataset 
dataFile <- "./R_folder/household_power_consumption.txt" 

data <- read.table(dataFile, header=TRUE, sep= ";", stringsAsFactors=FALSE, dec=".", na.strings ="?")

# subset it (only need 2 days in February 2007)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

times <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subset$Global_active_power)
sub_metering1 <- as.numeric(subset$Sub_metering_1)
sub_metering2 <- as.numeric(subset$Sub_metering_2)
sub_metering3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)

# draw the plot
plot(times, sub_metering1, type="l", xlab="",ylab="Energy sub metering")
lines(times, sub_metering2, type="l", col="red")
lines(times, sub_metering3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"))

# close the device
dev.off()