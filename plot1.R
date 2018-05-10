##Plotting the household energy usage over a 2-day period in Feb 2007
##Plot1 reconstructs a histogram of the frequency of Global Active Power

##download and unzip the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download <- download.file(fileUrl, destfile = "./data/dataset.zip")

##unzip the dataset in the /data directory
unzip(zipfile = "./data/dataset.zip", exdir = "./data")

##read in data table
power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##subset on selected dates
power2 <- power[(power$Date == "1/2/2007" | power$Date == "2/2/2007"),]

##plot histogram of Global Active Power and export png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(power2$Global_active_power, main = "Global Active Power", col = "red", border = "black", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()