library(dplyr)
library(lubridate)

#Read in data from file and manipulate to proper formats
#eda1 <- read.csv2(file = "household_power_consumption.txt",stringsAsFactors = FALSE)
#eda1.1 <- subset(eda1,Date %in% c("1/2/2007","2/2/2007"))
#eda1.2 <- mutate(eda1.1,DT = as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))
eda1.2$Global_active_power <- as.numeric(eda1.2$Global_active_power)
eda1.2$Global_reactive_power <- as.numeric(eda1.2$Global_reactive_power)
eda1.2$Voltage <- as.numeric(eda1.2$Voltage)
eda1.2$Sub_metering_1 <- as.numeric(eda1.2$Sub_metering_1)
eda1.2$Sub_metering_2 <- as.numeric(eda1.2$Sub_metering_2)
eda1.2$Sub_metering_3 <- as.numeric(eda1.2$Sub_metering_3)

#Create 2x2 plot matrix
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

#Top left
plot(eda1.2$DT,eda1.2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Top right
plot(eda1.2$DT,eda1.2$Voltage, type="l", xlab="datetime",ylab="Voltage")

#Bottom left
plot(eda1.2$DT,eda1.2$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l",col="black")
lines(eda1.2$DT,eda1.2$Sub_metering_2, col="red")
lines(eda1.2$DT,eda1.2$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1),bty="n")

#Bottom rght
plot(eda1.2$DT,eda1.2$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()