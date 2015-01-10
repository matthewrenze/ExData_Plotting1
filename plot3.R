# Set working directory
setwd("C:/Work/Coursera/Exploratory Data Analysis/Project 1")

# Load data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Concatenate data and time strings
dateAndTime = paste(data$Date, data$Time)

# Create date/time column
data$DateTime <- as.POSIXct(dateAndTime, format="%d/%m/%Y %H:%M:%S")

# Cast factors to numerics
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Filter data by dates
startDate = as.POSIXct('2007-02-01 00:00:00')
endDate = as.POSIXct('2007-02-03 00:00:00')
filtered <- data[data$DateTime >= startDate & data$DateTime < endDate,]

# Create canvas for plot 3
png("plot3.png",
    width = 480,
    height = 480,
    units = "px",
    bg = "transparent")

# Render plot 3
plot(
  filtered$DateTime,
  filtered$Sub_metering_1,
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Energy sub metering")

lines(
  filtered$DateTime,
  filtered$Sub_metering_2,
  type = "l",
  col = "red")

lines(
  filtered$DateTime,
  filtered$Sub_metering_3,
  type = "l",
  col = "blue")

legend(
  "topright",
  lwd=1,
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col=c("black", "red", "blue"))

# Close graphics device
dev.off()