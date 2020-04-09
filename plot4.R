setwd("C:/Users/ERICK/Desktop/R PROGRAMMING/Exploratory data Analysis")
list.files("C:/Users/ERICK/Desktop/R PROGRAMMING/Exploratory data Analysis")
library(xlsx)
library(readxl)
Workbook <- read_excel("household_power_consumption3.xlsx")
# You need to select the specified dates i.e 01/02/2007 to 02/02/2007
# by using selectByDate utility function
# change class for the date column

Dateconverted <- as.Date(Workbook$Date, format = "%d/%m/%Y")
workbook2 <- cbind(Dateconverted, Workbook)

#Delete the date column that is duplicate "Date"
workbook2$Date <- NULL
workbook2
#Rename the column 1 back to date after changing the class
colnames(workbook2)[which(names(workbook2) == "Dateconverted")] <- "Date"
workbook2
#library(openair)
#data.2007 <- selectByDate(Workbook, start = "2007-02-01", end = "2007-02-02")
as.data.frame(workbook2)
#i have subset the dates of 1/2/2007 and 2/2/2007 by selecting the rows from 221998 to 24876
workbook3 <- workbook2[21998:24876, ]
#Plot 1 Frequency/ Global Active power
#open at png file to plot
png(plot4.png)
#plot the graph 4
par(mfrow = c(2,2), mar = c(4,4,2,1))
with (workbook3, {
  barplot(workbook3$Global_active_power, ylab = "Global Active power (Kilowatts)", 
          col = "white", width = 1, density = NULL)
  
  boxplot( workbook3$Sub_metering_1, workbook3$Sub_metering_2, workbook3$Sub_metering_3,  
           border = "steelblue", names = c("Thursday", "Friday", "saturday"))
  
  barplot(workbook3$Voltage, xlab = "DateTime", ylab = "Volatge",
          col = "white", density = NULL, border = "blue")
  
  barplot(workbook3$Global_active_power, ylab = "Global Active power (Kilowatts)", 
          width = 1, density = NULL)
  
})

