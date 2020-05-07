
# GRAPH 4
datafile <- "household_power_consumption.txt"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#subset needed data based on date
data1 <- filter(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")
#convert the dates and time
data2 <- as.Date(data1$Date, format =  "%d/%m/%Y")
#Add the days
datedays <- paste(as.Date(data1$Date), data1$Time)
datedays1 <- as.Date(datedays)
Global_power <- as.numeric(data1$Global_active_power)
#combine to one data frame
data3 <- cbind(datedays1, Global_power)
data4 <- as.data.frame(data3)
class(data4$datedays1) = "Date"
#plotting the graphs
png("plot4.png", width = 480, height = 480)

#graph 3
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
#plot the graphs

par(mfrow=c(2,2), mar=c(4,4,2,1))
#plot 1
with(data4, plot(Global_power, type = "l", ylab = "Global Active Power(Kilowatts)"))
#plot 2
voltage <- as.numeric(data1$Voltage)
with(data1, plot(voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
#plot 3
with(data, plot(Sub_metering1, type = "l", ylab = "Energy submetering", xlab = ""))
lines(data, Sub_metering2, type = "l", col= "red")
lines(data, Sub_metering3, type = "l", col= "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = ,
       lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
#plot 4
GlobalActivepower <- as.numeric(data1$Global_reactive_power)
with(data1, plot(GlobalActivepower, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
