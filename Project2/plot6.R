
library(ggplot2)
library(plyr)

NEI <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/Source_Classification_Code.rds")

motor_index <- SCC[SCC$EI.Sector == 'Mobile - On-Road Gasoline Light Duty Vehicles' | 
                     SCC$EI.Sector == 'Mobile - On-Road Gasoline Heavy Duty Vehicles' | 
                     SCC$EI.Sector == 'Mobile - On-Road Diesel Light Duty Vehicles' |
                     SCC$EI.Sector == 'Mobile - On-Road Diesel Heavy Duty Vehicles' |
                     SCC$EI.Sector == 'Mobile - Aircraft' | 
                     SCC$EI.Sector == 'Mobile - Locomotives' | 
                     SCC$EI.Sector == 'Mobile - Commercial Marine Vessels',]

motor_data <- NEI[NEI$SCC %in% motor_index$SCC,]

motor_data$EI.Sector <- motor_index[match(motor_data$SCC, motor_index$SCC),'EI.Sector']

motor_data <- motor_data[is.finite(motor_data$Emissions),]

motor_data$EI.Sector <- revalue(motor_data$EI.Sector, c('Mobile - On-Road Gasoline Light Duty Vehicles'='Gas\nLight Duty\nVehicles',
                                                        'Mobile - On-Road Gasoline Heavy Duty Vehicles'='Gas\nHeavy Duty\nVehicles',
                                                        'Mobile - On-Road Diesel Light Duty Vehicles' = 'Diesel\nLight Duty\nVehicles',
                                                        'Mobile - On-Road Diesel Heavy Duty Vehicles' = 'Diesel\nHeavy Duty\nVehicles',
                                                        'Mobile - Aircraft' = 'Aircraft',
                                                        'Mobile - Locomotives' = 'Locomotives',
                                                        'Mobile - Commercial Marine Vessels' = 'Commercial\nMarine\nVessels'))

png('/Users/tbroiles/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project2/plot6.png')

qplot(log(Emissions), data = motor_data[motor_data$fips == '24510' | motor_data$fips == '06037',], color = fips, 
      facets = EI.Sector ~ year, geom = 'density', xlab = 'Log Motor Vehicle Emissions', ylim = c(0,1))

dev.off()

