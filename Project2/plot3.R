library(ggplot2)

NEI <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/Source_Classification_Code.rds")

NEI$Emissions[NEI$Emissions == 0] <- NA

png('/Users/tbroiles/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project2/plot3.png')

qplot(year, log(Emissions), data = NEI[NEI$fips == '24510',], facets = type ~ ., geom = c('point','smooth'), method = 'loess')

dev.off()