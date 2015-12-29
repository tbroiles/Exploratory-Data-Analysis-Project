NEI <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/Source_Classification_Code.rds")

png('/Users/tbroiles/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project2/plot1.png')

plot(unique(NEI$year), tapply(NEI$Emissions, NEI$year, sum), xlab = 'Year', ylab = 'Total Emissions per Year')

dev.off()
