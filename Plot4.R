##loading de data 
my_data <- read.delim("./household_power_consumption.txt", sep = ";", header = TRUE)

##using library "dplyr" to facilitate the analysis and just use the important information.

library(dplyr)
Active_powerData <-  filter(my_data, Date == "1/2/2007" | Date == "2/2/2007")

##transforming date and time into objects

Active_powerData$Date <- as.Date(Active_powerData$Date, format="%d/%m/%Y")
Active_powerData$Time <- strptime(Active_powerData$Time, format="%H:%M:%S")
Active_powerData[1:1440,"Time"] <- format(Active_powerData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Active_powerData[1441:2880,"Time"] <- format(Active_powerData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Adjustng parameters of the plot

par(mfrow=c(2,2))
par(mar=c(1,1,1,1))

## Using the plot function to do 4 plots and save the plot in png format

png(filename = "plot4.png", width = 480, height = 480, units = "px")
with(Active_powerData,{
  plot(Active_powerData$Time,as.numeric(as.character(Active_powerData$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(Active_powerData$Time,as.numeric(as.character(Active_powerData$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(Active_powerData$Time,Active_powerData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(Active_powerData,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(Active_powerData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(Active_powerData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(Active_powerData$Time,as.numeric(as.character(Active_powerData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

##saving the image in the directory work

dev.off()

