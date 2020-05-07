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
png("plot2.png", width = 480, height = 480)
#plot the data
datedays1 <- as.Date(datedays)
Global_power <- as.numeric(data1$Global_active_power)
#combine to one data frame
data3 <- cbind(datedays1, Global_power)
data4 <- as.data.frame(data3)
class(data4$datedays1) = "Date"
#join the two dataframes [ Global power and datedays2
with(data4, plot(Global_power, type = "l", ylab = "Global Active Power(Kilowatts)"))

dev.off()
