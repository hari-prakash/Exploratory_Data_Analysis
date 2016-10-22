rm(list = ls())
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subSetData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subSetData$datetime <- strptime(paste(subSetData$Date, subSetData$Time), "%Y-%m-%d %H:%M:%S")

png("plot_2.png", width=480, height=480)
plot(subSetData$datetime,subSetData$Global_active_power,  type = "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()