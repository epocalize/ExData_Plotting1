## Read data
data <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, 
                 na.strings = "?", header = TRUE, sep= ";", 
                 colClasses = c("character", "character", rep("numeric", 1, 7)))

## Subset data for desired dates + convert dates and times to desired format
days <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
data$dateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
dates <- data[as.Date(strptime(data$Date, "%d/%m/%Y")) %in% days, ]

## Construct plot and save to PNG
png(file = "plot3.png", width = 480, height = 480, bg = "white")

plot(dates$dateTime, dates$Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "l", col = "black")
lines(dates$dateTime, dates$Sub_metering_2, col = "red")
lines(dates$dateTime, dates$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()
