##Plotting the household energy usage over a 2-day period in Feb 2007
##Plot1 reconstructs x-y line plot of Global Active Power over each day

##download and unzip the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download <- download.file(fileUrl, destfile = "./data/dataset.zip")

##unzip the dataset in the /data directory
unzip(zipfile = "./data/dataset.zip", exdir = "./data")

##read in data table
power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##subset on selected dates and change format of date and time
library(dplyr)

power2 <- filter(power, Date == "2/2/2007" | Date == "1/2/2007") %>%  
  mutate(GAP = as.numeric(Global_active_power)) %>%   
  mutate(date_time = as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))  

#plot x-y line graph 
png(filename="plot3.png", width = 480, height = 480)

plot(power2$date_time, power2$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")
lines(power2$date_time, power2$Sub_metering_2, type = "l", col = "red")
lines(power2$date_time, power2$Sub_metering_3, type = "l", col = "blue")
dev.off()