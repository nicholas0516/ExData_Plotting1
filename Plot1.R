
##loading de data 

my_data <- read.delim("./household_power_consumption.txt", sep = ";", header = TRUE)

##using library "dplyr" to facilitate the analysis and just use the important information.

library(dplyr)
Active_powerData <- select(my_data, Date:Global_active_power)
Active_powerData2 <- filter(Active_powerData, Date == "1/2/2007" | Date == "2/2/2007")

##using the plot function to create a histogram and save the plot in png format

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(as.character(Active_powerData2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()






