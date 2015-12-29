
library(ggplot2)

NEI <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/tbroiles/Downloads/exdata-data-NEI_data/Source_Classification_Code.rds")

coal_index <- SCC[SCC$EI.Sector == 'Fuel Comb - Electric Generation - Coal' | 
               SCC$EI.Sector == 'Fuel Comb - Electric Generation - Coal & Fuel Comb - Industrial Boilers, ICEs - Coal' | 
               SCC$EI.Sector == 'Fuel Comb - Comm/Institutional - Coal',]

coal_data <- NEI[NEI$SCC %in% coal_index$SCC,]

coal_data$EI.Sector <- coal_index[match(coal_data$SCC, coal_index$SCC),'EI.Sector']

png('/Users/tbroiles/Dropbox/Coursera/Data_Science_Certification/Exploratory_Data_Analysis/Course_Project/Project2/plot4.png')

qplot(log(Emissions), data = coal_data, color = EI.Sector, facets = year ~ ., xlab = 'Log Coal Emissions')

dev.off()

