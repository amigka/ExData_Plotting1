#read txt file
Elpowerconsumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#restrict data to 2 first days of February
Elpowerconsumption$Date <- as.Date(Elpowerconsumption$Date, format="%d/%m/%Y")
final <- subset(Elpowerconsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# convert the Date and Time variables to Date/Time
DateTime <-paste(final$Date,final$Time)
final$DateTime <-strptime(DateTime, "%Y-%m-%d %H:%M:%S")
# Plot 2
plot(final$DateTime,final$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")
# Save to png
dev.copy(device = png, width = 480, height = 480, file = "Plot2.png")
dev.off()
