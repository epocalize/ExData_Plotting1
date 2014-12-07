## Read data
data <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, 
                 na.strings = "?", header = TRUE, sep= ";", 
                 colClasses = c("character", "character", rep("numeric", 1, 7)))

## Subset data for desired dates + convert dates and times to desired format
days <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
data$dateTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
dates <- data[as.Date(strptime(data$Date, "%d/%m/%Y")) %in% days, ]

## Construct plot and save to PNG
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

plot(dates$dateTime, dates$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()