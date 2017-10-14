# read data into R
files <- file('household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 2
# convert data and time to specific format
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename = './figures/plot2.png', width=480, height=480, units='px')
# plot figure
plot(DateTime, data$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()