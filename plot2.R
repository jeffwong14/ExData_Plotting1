plot2 <- function() {
    #Read Column names
    colnames <- c(t(read.csv("household_power_consumption.txt", header = F, 
                             nrows = 1, sep = ";")[1,]))
    #Read Data
    data <- read.csv("household_power_consumption.txt", header = F, 
                     skip = 66637, nrows = 2880, sep = ";", col.names = colnames)
    #Convert the date & Time into Date Time format
    data <- data.frame(data, "DateTime" = strptime(
        paste(data[, "Date"] , data[, "Time"], sep = " "), format = "%d/%m/%Y %H:%M:%S"))
    
    #Plot the line datetime vs global active power
    png(filename = "plot2.png", width = 480, height = 480)
    with(data, plot(DateTime, Global_active_power, 
                    type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
    dev.off()
}