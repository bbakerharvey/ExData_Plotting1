
plot2 <- function() {

## Course Project #1 for Exploratory Data Analysis
##  by bbakerharvey

##  Original data set is downloaded from:
##  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##  This function assumes the dataset has been downloaded and unzipped
##  into the local working directory.

##  Make a plot onto png device at default resolution 480x480

png(filename="plot2.png")


fulldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

fulldata$days <- as.Date(fulldata$Date,format="%d/%m/%Y")

v2 <- as.Date(fulldata$days) == "2007-02-01"

v1 <- as.Date(fulldata$days) == "2007-02-02"

vselect <- v1 | v2

mydata <- fulldata[vselect,]

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time),format="%d/%m/%Y %H:%M:%S")


plot(mydata$datetime,mydata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(mydata$datetime,mydata$Global_active_power)

dev.off()
}
