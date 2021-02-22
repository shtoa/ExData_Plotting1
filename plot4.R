# Reads data as a tibble to allow for selection of dates using filter() function
data <- as_tibble(fread("data.txt"))

# Converts date to Date class
data$Date <- dmy(data$Date)

# Selects first 2 dates of Febuary 2007 for analysis into processed data
date1 <-  ymd("2007-02-01")
date2 <- ymd("2007-02-02")
pdata <- filter(data, data$Date >= date1 & date2 >= data$Date)

# Converts time to Time type
pdata$Time <- hms(pdata$Time)

# Create a variable compromised of date and time
datetime <- pdata$Date + pdata$Time

# Make PNG
png("plot4.png", width = 480, height = 480, units = "px")

        # Specifying to create a 2x2 plot window
        par(mfrow = c(2,2))
        
        # Plot 1,1
        plot(datetime, pdata$Global_active_power,col = "black", type = "l", xlab = "", ylab = "Global Active Power")
        
        # Plot 1,2
        plot(datetime, pdata$Voltage,col = "black", type = "l", xlab = "datetime", ylab = "Voltage")
        
        # Plot 2,1 (Simillar Code to plot3.R but smaller legend without background)
        plot(datetime, pdata$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")
        lines(datetime, pdata$Sub_metering_1,col = "black", type = "l")
        lines(datetime, pdata$Sub_metering_2,col = "red", type = "l")
        lines(datetime, pdata$Sub_metering_3,col = "blue", type = "l")
        legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = 1, cex = 0.65, bty = "n")
        
        # Plot 2,2
        plot(datetime, pdata$Global_reactive_power,col = "black", type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close file
dev.off()