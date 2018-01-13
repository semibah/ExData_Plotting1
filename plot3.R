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
###plot3
#Paste and format columns 1 and 2 with strptime() for a time-series appropriate format
#Save to variable "x" to callback with line() function when adding additional parameters to plot
x <- strptime(paste(data[,1],data[,2]), "%Y-%m-%d %H:%M:%S")
plot(x, data[,7],col="black", type="l", xlab="",ylab="Energy sub metering")
lines(x,data[,8],col="red")
lines(x,data[,9],col="blue")
legend("topright", legend=names(data[,7:9]), col=c("black","red","blue"),lty=1)
#Print png to disk with specified resolution
dev.print(device = png, filename = "plot3.png", width=480, height=480)
#Close graphics device
dev.off()