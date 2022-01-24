
library(ggplot2)
library(dplyr)

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#download and unzip the file

path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, file.path(path, "exdata_data_NEI_data.zip"))
unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
head(SCC)


png(filename = "plot1.png")
merged_data <- merge(NEI, SCC, by = "SCC")
anual_total_emission <- aggregate(Emissions ~ year, data = merged_data, sum, na.rm=TRUE)
g1 <-barplot(height = anual_total_emission$Emissions, names = anual_total_emission$year)
dev.off()

