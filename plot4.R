
plot4 <- function() {

## Course Project #1 for Exploratory Data Analysis
##  by bbakerharvey

##  Original data set is downloaded from:
##  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##  This function assumes the dataset has been downloaded and unzipped
##  into the local working directory.

##  Make a plot onto png device at default resolution 480x480

png(filename="plot4.png")


fulldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

fulldata$days <- as.Date(fulldata$Date,format="%d/%m/%Y")

v2 <- as.Date(fulldata$days) == "2007-02-01"

v1 <- as.Date(fulldata$days) == "2007-02-02"

vselect <- v1 | v2

mydata <- fulldata[vselect,]

mydata$datetime <- strptime(paste(mydata$Date,
	mydata$Time),format="%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))

plot(mydata$datetime,mydata$Global_active_power, type="n", xlab="",
	ylab="Global Active Power")
lines(mydata$datetime,mydata$Global_active_power)




plot(mydata$datetime,mydata$Sub_metering_1, type="n", xlab="",
	ylab="Energy sub metering")
lines(mydata$datetime,mydata$Sub_metering_1,col="black")
lines(mydata$datetime,mydata$Sub_metering_2,col="red")
lines(mydata$datetime,mydata$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	col=c("Black","Red","Blue"),lwd=2, bty="n")


plot(mydata$datetime,mydata$Voltage, type="n", xlab="datetime", 
	ylab="Voltage")
lines(mydata$datetime,mydata$Voltage)

plot(mydata$datetime,mydata$Global_reactive_power, type="n", xlab="datetime",
	ylab="Global_reactive_power")
lines(mydata$datetime,mydata$Global_reactive_power)

dev.off()
}
