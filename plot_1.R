rm(list = ls())
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subSetData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

png("plot_1.png", width=480, height=480)
hist(subSetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()