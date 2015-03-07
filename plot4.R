library(lubridate)
library(dplyr)

## Path where the files are present
setwd("C:/Users/dinesh.kotti/Desktop/Personal/Career/JHMacLearning/Exploratory Data Analysis/Project1/")
data_dir <- getwd()

data_p <- paste(data_dir, "/household_power_consumption.txt", sep="")
data <- read.table(data_p, header=TRUE, sep=";", fill=TRUE)
data_filt <- filter(data, Date == c("2/2/2007", "1/2/2007"))

x_param <- unique(wday(data_filt$Date, label=TRUE))

png(filename = "plot4.png", width=480, height=480, units = "px", type= "windows")


par(mfrow = c(2,2))
with(data_filt, {
  plot(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Global_active_power)), type= "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
  plot(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Voltage)), xlab = "datetime", ylab = "Voltage", type = "l")
  plot(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Sub_metering_1)), xlab = "", ylab = "Global Active Power (Kilowatts)", type = "n")
  points(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Sub_metering_1)), type= "l")
  points(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Sub_metering_2)), type= "l", col="red")
  points(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Sub_metering_3)), type="l", col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="-", lwd=3, col=c("black", "red", "blue"))
  plot(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(as.character(data_filt$Global_reactive_power)), xlab = "datetime", ylab = "Global_reactive_power", type="l")
  
})


dev.off()