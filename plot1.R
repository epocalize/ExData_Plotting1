## Read data
data <- read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, 
                 na.strings = "?", header = TRUE, sep= ";", colClasses = c("character",
                 "character", rep("numeric", 1, 7)))

## Subset data for desired dates + convert dates to desired format
dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
days <- data[as.Date(strptime(data$Date, "%d/%m/%Y")) %in% dates, ]

## Construct plot and save to PNG
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

hist(days$Global_active_power, main = "Global Active Power", col = "red", xlab = 
             "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
