library(ggplot2)
library(dplyr)

png(filename = "plot2.png")
baltimore_type <- aggregate(Emissions ~ year + type, data = subset(merged_data, fips == "24510"), sum, na.rm=TRUE)
baltimore_data <- aggregate(Emissions ~ year, data = subset(merged_data, fips == "24510"), sum, na.rm=TRUE)
g2 <- barplot(height = baltimore_data$Emissions, names = baltimore_data$year)
g2
dev.off()