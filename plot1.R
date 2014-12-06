plot1 <- function() {
    #Read Column names
    colnames <- c(t(read.csv("household_power_consumption.txt", header = F, 
                             nrows = 1, sep = ";")[1,]))
    #Read Data
    data <- read.csv("household_power_consumption.txt", header = F, 
                     skip = 66637, nrows = 2880, sep = ";", col.names = colnames)
    
    #Plot the histogram
    png(filename = "plot1.png", width = 480, height= 480)
    with(data, hist(Global_active_power, main = "Global Active Power", 
                    col = "red", xlab = "Global Active Power (kilowatts)"))
    dev.off()
}