# Code to construct plot 1

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

# set the device to save to png
png(filename = "plot1.png", bg = "white")
# Prepare the histogram
hist(my_data$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
# Turn off the png device
dev.off()