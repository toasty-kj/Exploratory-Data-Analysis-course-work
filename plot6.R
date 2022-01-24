library(ggplot2)
library(dplyr)

png(filename = "plot6.png")
compare_car <- function(index) {
        car_data <- subset(merged_data, fips == index)
        col_list <- NULL
        for (i in 1: ncol(car_data))
                if (length(grep("[Cc]ar", car_data[,i])) > 0) {col_list <- append(col_list, i);
                print(colnames(car_data[i]))}
        data_list <- NULL
        for (i in 1 : length(col_list)) col_list <- append(col_list, grep("[Cc]ar", car_data[,col_list[i]]))
        data_list <- unique(data_list)
        car_related_emission <- aggregate(Emissions ~ year, data = car_data[col_list, 4:6], sum, na.rm=TRUE)
}
bal_car <- compare_car("24510")
LA_car <- compare_car("06037")
bal_car <- mutate(bal_car, country = "baltimore")
LA_car <- mutate(LA_car, country = "Los Angels")
t <- rbind(bal_car, LA_car)
ggplot(t, aes(factor(year), Emissions, fill = country, color = country)) + geom_bar(stat = "identity", show.legend = TRUE, position = "dodge")
dev.off()