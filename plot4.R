run <- function() {
  
  # download data if it doesnt exist
  if (!file.exists("household_power_consumption.txt")) {
    
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, "data.zip")
    unzip("data.zip")
    file.remove("data.zip")
    
  }
  
  library(readr)
  
  # import and remove irrelevent dates
  df <- read_delim("household_power_consumption.txt", ";", 
                   escape_double = FALSE, col_types = cols(Time = col_character()), 
                   trim_ws = TRUE)
  
  # Subset the data and merge Date and Time column
  df <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]
  df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")
  
  # Start the png device
  png(filename = "plot4.png", units = "px", width = 480, height = 480, bg = "white")
  
  #Segment the plot window
  par(mfrow = c(2, 2))
  
  # 1 (from top left to right)
  plot(df$DateTime, df$Global_active_power, type="l", 
       xlab = "", ylab = "Global Active Power")
  
  # 2
  plot(df$DateTime, df$Voltage, type="l", 
       xlab = "datetime", ylab = "Voltage")
  
  # 3
  plot(df$DateTime, df$Sub_metering_1, type="l", 
       xlab="", ylab="Energy sub metering")
  lines(df$DateTime, df$Sub_metering_2, col = "red")
  lines(df$DateTime, df$Sub_metering_3, col = "blue")
  legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # 4
  plot(df$DateTime, df$Global_reactive_power, type = "l", 
       xlab = "datetime", ylab = "Global_reactive_Power")
  
  # turn off device
  dev.off()
  
}