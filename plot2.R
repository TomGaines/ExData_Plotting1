## Load the data into a table
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

##reduce data into only the 2 days we're interested in
subdata<- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##chage the variable type of Date and Time columns
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##create a png file of plot 2
png("plot2.png", width=480, height=480)

plot(x=subdata$Time, y=as.numeric(subdata$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")




##Returns graphic output to R
dev.off()
