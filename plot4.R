plot4 <- function() {
    #Read Column names
    colnames <- c(t(read.csv("household_power_consumption.txt", header = F, 
                             nrows = 1, sep = ";")[1,]))
    #Read Data
    data <- read.csv("household_power_consumption.txt", header = F, 
                     skip = 66637, nrows = 2880, sep = ";", col.names = colnames)
    #Convert the date & Time into Date Time format
    data <- data.frame(data, "DateTime" = strptime(
        paste(data[, "Date"] , data[, "Time"], sep = " "), format = "%d/%m/%Y %H:%M:%S"))
    
    #Prepare to show 4 graphs
    png(filename = "plot4.png", width = 480, height = 480)
    par(mfrow = c(2,2))
    
    #Graph 1 - datetime vs global active power
    with(data, plot(DateTime, Global_active_power, 
                    type = "l", ylab = "Global Active Power", xlab = ""))
    
    #Graph 2 - datetime vs Voltage
    with(data, plot(DateTime, Voltage, 
                    type = "l", ylab = "Voltage", xlab = "datetime"))
    
    #Graph3 - datetime vs Energy sub metering
    with(data, plot(DateTime, Sub_metering_1, 
                    type = "n", ylab = "Energe sub metering", xlab = ""))
    with(data, points(DateTime, Sub_metering_1, type = "l"))
    with(data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
    with(data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", lty=1, col = c("black", "red", "blue"), bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    #Graph4 - datetime vs Global reactive power
    with(data, plot(DateTime, Global_reactive_power, 
                    type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
    dev.off()
}