
#3rd PLOTTINGS

#plotting the second graph
datafile <- "household_power_consumption.txt"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#subset needed data based on date
data1 <- filter(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")
#convert the dates and time
data2 <- as.Date(data1$Date, format =  "%d/%m/%Y")
#Add the days
datedays <- paste(as.Date(data1$Date), data1$Time)
#plotting the data
png("plot3.png", width = 480, height = 480)
#plot the data
datedays1 <- as.Date(datedays)
Sub_metering1 <-  as.numeric(data1$Sub_metering_1)
Sub_metering2 <-  as.numeric(data1$Sub_metering_2)
Sub_metering3 <-  as.numeric(data1$Sub_metering_3)
#combine to one data frame
sub_metering <- cbind(datedays,Sub_metering1, Sub_metering2, Sub_metering3)
as.data.frame(sub_metering)
class(data4$datedays1) = "Date"
#join the two dataframes [ Global power and datedays2
data <- as.data.frame(sub_metering)
library(ggplot2)
ggplot(data, aes(x = datedays, group = 3)) +
  geom_line(aes(y = Sub_metering1)) + 
  geom_line(aes(y = Sub_metering2), color="steelblue") +  
  geom_line(aes(y = Sub_metering3), color="red") 
#copy
dev.off()


