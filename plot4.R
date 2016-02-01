url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url, "power.zip")
#unzip("power.zip")
dir()
d <- read.csv("household_power_consumption.txt", sep=";", na="?")
d1 <- subset(d, Date =="1/2/2007" | Date =="2/2/2007")
rm(d)

date_time <- paste(d1$Date, d1$Time, sep=" ")
x <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
d1$date_time <- x

png("plot4.png")
par(mfrow=c(2,2), mar=c(4,4,1,1))
plot(d1$date_time, d1$Global_active_power, type="l", ylab="Global active power (kilowatt)", xlab="datetime")
plot(d1$date_time, d1$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(d1$date_time, d1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="datetime")
lines(d1$date_time, d1$Sub_metering_2, col="red")
lines(d1$date_time, d1$Sub_metering_3, col="blue")
legend(x="topright",  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5, 2.5),col=c("black","red","blue"))
plot(d1$date_time, d1$Global_reactive_power, type="l", ylab="Global reactive power", xlab="datetime")

dev.off()

 


