library(dplyr)
library(tidyr)
#load the Data set
setwd("C:/Users/ERICK/Desktop/R PROGRAMMING/Exploratory data Analysis")
list.files("C:/Users/ERICK/Desktop/R PROGRAMMING/Exploratory data Analysis")

datafile <- "household_power_consumption.txt"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
GlobalActivepower <- as.numeric(subsetData$Global_active_power)

#PLOTTING GRAPH 1
#plotting and saving the data
png("plot1.png", width = 480, height = 480)
hist(GlobalActivepower, col = "red", main = "Global Active Power", xlab = "Global Active power(kilowats)")
dev.off()
