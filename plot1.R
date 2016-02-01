url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power.zip")
unzip("power.zip")
dir()
d <- read.csv("household_power_consumption.txt", sep=";", na="?")
d1 <- subset(d, Date =="1/2/2007" | Date =="2/2/2007")
rm(d)
png("plot1.png")
hist(d1$Global_active_power, col="red", main="Global Active Power", xlab="Global active power (kilowatts)")
dev.off()

 


