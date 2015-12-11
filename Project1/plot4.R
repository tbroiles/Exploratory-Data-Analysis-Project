
plot4 <- function(f = '/Users/tomathy/Desktop/household_power_consumption.txt'){
  data <- read.csv(f, sep = ';', na.strings = "?")
  data$Date <- strptime(paste(as.vector(data$Date), as.vector(data$Time)), format = "%d/%m/%Y %H:%M:%S")
  index <- data$Date >= strptime('01/02/2007 00:00:00', format = "%d/%m/%Y %H:%M:%S") & 
    data$Date < strptime('03/02/2007 00:00:00', format = "%d/%m/%Y %H:%M:%S")
  
  png('/Users/tomathy/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project1/plot4.png')
  par(mfrow = c(2,2))
  
  plot(data$Date[index], data$Global_active_power[index], type = 'l', xlab = '', ylab = 'Global Active Power')
  
  plot(data$Date[index], data$Voltage[index], type = 'l', xlab = 'datetime', ylab = 'Voltage')
  
  plot(data$Date[index],data$Sub_metering_1[index], type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(data$Date[index],data$Sub_metering_2[index], col = 'red')
  lines(data$Date[index],data$Sub_metering_3[index], col = 'blue')
  legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1), col = c('black', 'red', 'blue'), border = 'transparent')
  
  plot(data$Date[index], data$Global_reactive_power[index], type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
  
  dev.off()
}