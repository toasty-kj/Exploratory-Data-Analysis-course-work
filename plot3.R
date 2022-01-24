library(ggplot2)
library(dplyr)

png(filename = "plot3.png")
g3 <- ggplot(baltimore_type, aes(year, Emissions, color = type)) + geom_line(aes(type), show.legend = TRUE)
g3
dev.off()