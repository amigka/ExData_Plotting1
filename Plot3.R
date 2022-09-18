#read txt file
Elpowerconsumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#restrict data to 2 first days of February
Elpowerconsumption$Date <- as.Date(Elpowerconsumption$Date, format="%d/%m/%Y")
final <- subset(Elpowerconsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# convert the Date and Time variables to Date/Time
DateTime <-paste(final$Date,final$Time)
final$DateTime <-strptime(DateTime, "%Y-%m-%d %H:%M:%S")
# Plot 3
png("plo3.png", width=480, height=480)
with(final, {
  plot(DateTime, Sub_metering_1,type="l",ylab="Energy sub
       metering",xlab="") 
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend ("topright",lty=1, cex=0.5,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
)
# Close device
dev.off()
