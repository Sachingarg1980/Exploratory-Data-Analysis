# Load RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sample data for testing
NEIsample <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subset data and append two years in one data frame
MD1999 <- subset(NEI, fips=='24510' & year==1999)
MD2008 <- subset(NEI, fips=='24510' & year==2008)
plot2 <- rbind(MD1999, MD2008)

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
png(filename='plot2.png')
barplot(tapply(X=plot2$Emissions, INDEX=plot2$year, FUN=sum), 
                 main='Total Emission in Baltimore City, MD', xlab='Year', ylab=expression('PM'[2.5]))
dev.off()