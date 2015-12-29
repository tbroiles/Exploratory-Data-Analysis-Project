NEI <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/Source_Classification_Code.rds")

png('/Users/tbroiles/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project2/plot2.png')

plot(unique(NEI$year[NEI$fips == '24510']), tapply(NEI$Emissions[NEI$fips == '24510'], NEI$year[NEI$fips == '24510'], sum), xlab = 'Year', ylab = 'Total Emissions per Year in Baltimore City')

dev.off()