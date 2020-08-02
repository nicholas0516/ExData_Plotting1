##loading de data 
my_data <- read.delim("./household_power_consumption.txt", sep = ";", header = TRUE)

##using library "dplyr" to facilitate the analysis and just use the important information.

library(dplyr)
Active_powerData <- select(my_data, Date:Global_active_power)
Active_powerData2 <- filter(Active_powerData, Date == "1/2/2007" | Date == "2/2/2007")

##transforming date and time into objects
Active_powerData2$Date <- as.Date(Active_powerData2$Date, format="%d/%m/%Y")
Active_powerData2$Time <- strptime(Active_powerData2$Time, format="%H:%M:%S")
Active_powerData2[1:1440,"Time"] <- format(Active_powerData2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Active_powerData2[1441:2880,"Time"] <- format(Active_powerData2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Using the plot function
plot(Active_powerData2$Time,as.numeric(as.character(Active_powerData2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

##Define a title
title(main="Global Active Power Vs Time")

##saving the image in the directory work

png(filename = "plot2.png", width = 480, height = 480, units = "px")
