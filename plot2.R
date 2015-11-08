# Plot2 - line graph
# read in dataset
dataFile <- "./R_folder/household_power_consumption.txt" 

data <- read.table(dataFile, header=TRUE, sep= ";", stringsAsFactors=FALSE, dec=".", na.strings ="?")

# subset it (only need first two days in February 2007)
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

times <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# coerce Global_active_power from character to numeric type
global_active_power <- as.numeric(subset$Global_active_power)

# specify properties of the output file
png("plot2.png", width=480, height=480)

# draw a histogram
plot(times, global_active_power, type="l", main="Global Active Power", xlab=" ", ylab="Global Active Power (kilowatts)")

# close the device
dev.off()
