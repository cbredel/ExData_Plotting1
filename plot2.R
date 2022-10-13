#load and filter data
power <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Prepare data
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#plot
png("plot2.png", width=480, height=480)

plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

title(main="Global Active Power Vs Time")

dev.off()
