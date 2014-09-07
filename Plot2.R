##please set working directory accordingly before running the code.
setwd("~/Desktop/Project")

## loading data
library(sqldf)
read <- read.table("household_power_consumption.txt", sep = ";",header = T, na.strings = "?") 
read <- sqldf('select * from read where Date = "1/2/2007" OR Date = "2/2/2007"')
Time <- strptime(paste(read$Date,read$Time), "%d/%m/%Y %H:%M:%S") #time conversion

# plot 2
png(file = "plot2.png")
plot(Time,read$Global_active_power,type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()