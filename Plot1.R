#read txt file
Elpowerconsumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#restrict data to 2 first days of February
Elpowerconsumption$Date <- as.Date(Elpowerconsumption$Date, format="%d/%m/%Y")
final <- subset(Elpowerconsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# convert the Date and Time variables to Date/Time
DateTime <-paste(final$Date,final$Time)
final$DateTime <-strptime(DateTime, "%Y-%m-%d %H:%M:%S")
#Change class of Global active power
final[,3] <- as.numeric(final[,3])
# Plot 1
hist(final$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
# Save to png
dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")
dev.off()
