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
  df <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
  df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
  df <- subset(df, Date >= as.Date('2007-02-01', format = "%Y-%m-%d"))
  df <- subset(df, Date <= as.Date('2007-02-02', format = "%Y-%m-%d"))
  
  png(filename = "plot1.png", units = "px", width = 480, height = 480, bg = "white")
  plot1 <- hist(df$Global_active_power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  dev.off()
  
}