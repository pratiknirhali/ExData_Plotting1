#Step 1: Reading the data
data <- read.table("household_power_consumption.txt", header=T, sep=";"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")   #setting the date format
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]  #getting the data for the desired dates

#step 2: Setting the variable type
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#step 3: plot 2:

plot2 <- function() {
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}
