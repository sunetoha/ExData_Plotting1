# Code to construct plot 2

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
png(filename = "plot2.png", bg = "white")
# Prepare the plot
plot(my_data$Global_active_power~my_data$Chrono, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
# Turn off the png device
dev.off()