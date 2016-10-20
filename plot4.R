setwd("C:/Users/Sebastian/Documents/R Files/exdata%2Fdata%2Fhousehold_power_consumption")
main <-read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?')

#Simplify by dates of interest
main <- main[main$Date=='1/2/2007' | main$Date=='2/2/2007',]

#Combine date and time into single unit
main$Date <- as.Date(main$Date, format = '%d/%m/%Y')
main$DateTime <- as.POSIXct(paste(main$Date, main$Time))



#Create and plot histogram to file
if(!file.exists('plots')) dir.create('plots')
png(filename='./plots/plot4.png',width=480,height=480,units='px')
par(mfrow = c(2, 2))
#(1,1)
plot(main$DateTime, main$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
#(2,1)
plot(main$DateTime, main$Voltage, xlab = '', ylab = 'Voltage', type = 'l')
#(1,2)
plot(main$DateTime, main$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(main$DateTime, main$Sub_metering_2, col="red")
lines(main$DateTime, main$Sub_metering_3, col="blue")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
#(2,2)
plot(main$DateTime, main$Global_reactive_power, xlab = '', ylab = 'Global_reactive_Power', type = 'l')
dev.off()