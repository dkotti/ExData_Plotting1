library(lubridate)
library(dplyr)

## Path where the files are present
setwd("C:/Users/dinesh.kotti/Desktop/Personal/Career/JHMacLearning/Exploratory Data Analysis/Project1/")
data_dir <- getwd()

data_p <- paste(data_dir, "/household_power_consumption.txt", sep="")
data <- read.table(data_p, header=TRUE, sep=";", fill=TRUE)
data_filt <- filter(data, Date == c("2/2/2007", "1/2/2007"))

data_filt1 <- filter(data, Date == c("1/2/2007"))
data_filt2 <- filter(data, Date == c("2/2/2007"))

x_param <- unique(wday(data_filt$Date, label=TRUE))

png(filename = "plot2.png", width=480, height=480, units = "px", type= "windows")
plot(dmy(data_filt$Date)+hms(data_filt$Time), as.numeric(data_filt$Global_active_power)/1000, type= "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()