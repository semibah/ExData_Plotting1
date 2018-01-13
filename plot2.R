#Set working directory to fork's upper level folder
##Make sure to include "household_power_consumption.txt" in this folder
setwd("~/ExData_Plotting1")
#Setting locale for appropriate date handling
Sys.setlocale("LC_TIME", "C")
#Load data as a data frame, keep headers and observations as strings.
data <- as.data.frame(read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE))
#Subset data points from 2007-02-01 to 2007-02-02
daterange <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")
#Switch column data type from "string" to "Date"
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data <- subset(data, data[,1] >= daterange[1] & data[,1]<= daterange[2])
##Plot2
#Paste and format columns 1 and 2 with strptime() for a time-series appropriate format
plot(strptime(paste(data[,1],data[,2]), "%Y-%m-%d %H:%M:%S"),
     data[,3],
     type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Print png to disk with specified resolution
dev.print(device = png, filename = "plot2.png", width=480, height=480)
#Close graphics device
dev.off()