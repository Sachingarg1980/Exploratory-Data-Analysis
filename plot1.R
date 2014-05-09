# Load RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sample data for testing
NEIsample <- NEI[sample(nrow(NEI), size=1000, replace=F), ]

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
png(filename='plot1.png')
barplot(tapply(X=NEI$Emissions, INDEX=NEI$year, FUN=sum), 
        main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression('PM'[2.5]))
dev.off()