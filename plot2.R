url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power.zip")
unzip("power.zip")
dir()
d <- read.csv("household_power_consumption.txt", sep=";", na="?")
d1 <- subset(d, Date =="1/2/2007" | Date =="2/2/2007")
rm(d)

date_time <- paste(d1$Date, d1$Time, sep=" ")
x <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
d1$date_time <- x

png("plot2.png")
plot(d1$date_time, d1$Global_active_power, type="l", ylab="Global active power (kilowatt)", xlab="")
dev.off()

 


