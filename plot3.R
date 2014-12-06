plot3 <- function() {
    #Read Column names
    colnames <- c(t(read.csv("household_power_consumption.txt", header = F, 
                             nrows = 1, sep = ";")[1,]))
    #Read Data
    data <- read.csv("household_power_consumption.txt", header = F, 
                     skip = 66637, nrows = 2880, sep = ";", col.names = colnames)
    #Convert the date & Time into Date Time format
    data <- data.frame(data, "DateTime" = strptime(
        paste(data[, "Date"] , data[, "Time"], sep = " "), format = "%d/%m/%Y %H:%M:%S"))
    
    #Plot the line datetime vs Energy sub metering
    png(filename = "plot3.png", width = 480, height = 480)
    with(data, plot(DateTime, Sub_metering_1, 
                    type = "n", ylab = "Energe sub metering", xlab = ""))
    with(data, points(DateTime, Sub_metering_1, type = "l"))
    with(data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
    with(data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
    #Add legend
    legend("topright", lty=1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}