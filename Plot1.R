##please set working directory accordingly before running the code.
setwd("~/Desktop/Project")

## loading data
library(sqldf)
read <- read.table("household_power_consumption.txt", sep = ";",header = T, na.strings = "?") 
read <- sqldf('select * from read where Date = "1/2/2007" OR Date = "2/2/2007"')
Time <- strptime(paste(read$Date,read$Time), "%d/%m/%Y %H:%M:%S") #time conversion

# plot 1
png(file = "plot1.png")
hist(read$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()