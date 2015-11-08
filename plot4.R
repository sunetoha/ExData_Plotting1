# Code to construct plot 4

# Prepare a vector of column names to be assigned to the data.frame
# because the original column names get skiped by read.table.
columnnames <- c("Date", "Time", "Global_active_power", 
                 "Global_reactive_power", "Voltage", "Global_intensity", 
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Read the lines corresponding to the dates of interest.
my_data <- read.table("household_power_consumption.txt", 
                      skip = 66636, nrows = 2880, header = TRUE, 
                      col.names = columnnames, 
                      sep = ";", na.strings = "?")

# Add a time column(Chrono) which integrates both time and date.
my_data <- transform(my_data, Chrono=strptime(paste(my_data$Date, my_data$Time), 
                                format = "%d/%m/%Y %H:%M:%S"))

# set the device to save to png
png(filename = "plot4.png", bg = "white")

# set the mfrow parameter to show four plots
par(mfrow = c(2,2)) 

# For upper left plot:
plot(my_data$Global_active_power~my_data$Chrono, type = "l", 
     ylab = "Global Active Power", xlab = "")

# For upper right plot:
plot(my_data$Voltage~my_data$Chrono, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

# For lower left plot:
plot(my_data$Sub_metering_1~my_data$Chrono, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering")
lines(my_data$Chrono, my_data$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(my_data$Chrono, my_data$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright", lty="solid", bty = "n", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# For lower right plot:
plot(my_data$Global_reactive_power~my_data$Chrono, 
     type = "l", 
     ylab = "Global_reactive_power", 
     xlab = "datetime")

# Turn off the png device
dev.off()