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
png("plot1.png")

        # Specifying to create a 1x1 plot window
        par(mfrow = c(1,1))
        
        # Plot Plot 1
        hist(as.numeric(pdata$Global_active_power), col = "Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Close file
dev.off()