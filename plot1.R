#Read file into R
setwd("C:/Users/Sebastian/Documents/R Files/exdata%2Fdata%2Fhousehold_power_consumption")
main <-read.table("household_power_consumption.txt",header=TRUE,sep=';',na.strings='?')

#Simplify by dates of interest
main <- main[main$Date=='1/2/2007' | main$Date=='2/2/2007',]

#Combine date and time into single unit
main$Date <- as.Date(main$Date, format = '%d/%m/%Y')
main$DateTime <- as.POSIXct(paste(main$Date, main$Time))

#Create and plot histogram to file
if(!file.exists('plots')) dir.create('plots')
png(filename='./plots/plot1.png',width=480,height=480,units='px')
with(main, hist(main$Global_active_power, xlab='Global Active Power (kilowatts)', main='Global_active_power', col='red'))
dev.off()