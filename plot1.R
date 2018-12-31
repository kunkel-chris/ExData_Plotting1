library(dplyr)
library(lubridate)

#Read in data from file and manipulate to proper formats
eda1 <- read.csv2(file = "household_power_consumption.txt",stringsAsFactors = FALSE)
eda1.1 <- subset(eda1,Date %in% c("1/2/2007","2/2/2007"))
eda1.2 <- mutate(eda1.1,DT = as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))
eda1.2$Global_active_power <- as.numeric(eda1.2$Global_active_power)

#OUtput histogram
png(filename="plot1.png", width=480, height=480, units="px")
with(eda1.2,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()