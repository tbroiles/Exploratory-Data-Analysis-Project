
plot2 <- function(f = '/Users/tomathy/Desktop/household_power_consumption.txt'){
  data <- read.csv(f, sep = ';', na.strings = "?")
  data$Date <- strptime(paste(as.vector(data$Date), as.vector(data$Time)), format = "%d/%m/%Y %H:%M:%S")
  index <- data$Date >= strptime('01/02/2007 00:00:00', format = "%d/%m/%Y %H:%M:%S") & 
    data$Date < strptime('03/02/2007 00:00:00', format = "%d/%m/%Y %H:%M:%S")
  
  png('/Users/tomathy/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project1/plot2.png')
  plot(data$Date[index],data$Global_active_power[index], type = 'l', xlab = '', ylab = 'Global Active Power (kW)')
  dev.off()
}