##please set working directory accordingly before running the code.
setwd("~/Desktop/Project")

## loading data
library(sqldf)
read <- read.table("household_power_consumption.txt", sep = ";",header = T, na.strings = "?") 
read <- sqldf('select * from read where Date = "1/2/2007" OR Date = "2/2/2007"')
Time <- strptime(paste(read$Date,read$Time), "%d/%m/%Y %H:%M:%S") #time conversion

# plot 3
png(file = "plot3.png")
plot(Time,read$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub melting")
lines(Time,read$Sub_metering_2,col = "red")
lines(Time,read$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,cex = .8, col = c("black","red","blue"))
dev.off()