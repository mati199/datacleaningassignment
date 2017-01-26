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
  
  df <- df[(df$Date=="1/2/2007" | df$Date=="2/2/2007"),]
  df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot2.png", units = "px", width = 480, height = 480, bg = "white")
  plot2 <- plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
  
}