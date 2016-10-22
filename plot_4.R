rm(list = ls())
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subSetData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

subSetData$datetime <- strptime(paste(subSetData$Date, subSetData$Time), "%Y-%m-%d %H:%M:%S")
Sub_metering_1 <- subSetData$Sub_metering_1
Sub_metering_2 <- subSetData$Sub_metering_2
Sub_metering_3 <- subSetData$Sub_metering_3


png("plot_4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(subSetData$datetime,subSetData$Global_active_power,  type = "l", ylab="Global Active Power", xlab="")

plot(subSetData$datetime,Sub_metering_1,  type = "l", ylab="Energy sub metering", xlab="")
lines(subSetData$datetime,Sub_metering_2,  type = "l", col='red')
lines(subSetData$datetime,Sub_metering_3,  type = "l", col='blue')
legend('topright',lty=1, col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty='n')

plot(subSetData$datetime,subSetData$Voltage,  type = "l", ylab="Voltage", xlab="")

plot(subSetData$datetime,subSetData$Global_reactive_power,  type = "l", ylab="Global_reactive_power", xlab="")
dev.off()