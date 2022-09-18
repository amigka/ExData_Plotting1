#read txt file
Elpowerconsumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#restrict data to 2 first days of February
Elpowerconsumption$Date <- as.Date(Elpowerconsumption$Date, format="%d/%m/%Y")
final <- subset(Elpowerconsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# convert the Date and Time variables to Date/Time
DateTime <-paste(final$Date,final$Time)
final$DateTime <-strptime(DateTime, "%Y-%m-%d %H:%M:%S")
# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(5,5,2,2))
with (final, {
  plot(DateTime,Global_active_power, type="l", ylab="Global Active Power",xlab="")
  plot(DateTime, Voltage, type="l",ylab="Voltage",xlab="datetime")
  plot(DateTime, Sub_metering_1,type="l",ylab="Energy submetering",xlab="") 
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend ("topright",bty="n",lty=1,lwd=2, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l",xlab="datetime")
})
# Close device
dev.off()
