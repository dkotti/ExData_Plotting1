library(dplyr)

## Path where the files are present
setwd("C:/Users/dinesh.kotti/Desktop/Personal/Career/JHMacLearning/Exploratory Data Analysis/Project1/")
data_dir <- getwd()

data_p <- paste(data_dir, "/household_power_consumption.txt", sep="")
data <- read.table(data_p, header=TRUE, sep=";", fill=TRUE)
data_filt <- filter(data, Date == c("2/2/2007", "1/2/2007"))

#png(filename = "plot1.png", width=480, height=480, units = "px", type= "windows")
hist(as.numeric(as.character(data_filt$Global_active_power)), col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", breaks=12)
#dev.off()