#Download the file and save into the working directory
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="Class4.1.Dataset.zip")
#Unizips the file and places the results in the working directory. 
unzip("Class4.1.Dataset.zip", exdir="Class4.1.Data")

powerdata_full <- read.csv(".\\Class4.1.Data\\household_power_consumption.txt", sep =';', header=TRUE)
powerdata_full$Date <- as.Date(powerdata_full$Date, "%d/%m/%Y")

powerdata_sub <- subset(powerdata_full, Date>='2007-02-01' & Date<='2007-02-02')
powerdata_sub$Global_active_power <- as.numeric(as.character(powerdata_sub$Global_active_power) )
powerdata_sub$Voltage <- as.numeric(as.character(powerdata_sub$Voltage))
powerdata_sub$Global_reactive_power <- as.numeric(as.character(powerdata_sub$Global_reactive_power))
powerdata_sub$Sub_metering_1 <- as.numeric(as.character(powerdata_sub$Sub_metering_1) )
powerdata_sub$Sub_metering_2 <- as.numeric(as.character(powerdata_sub$Sub_metering_2) )
powerdata_sub$Sub_metering_3 <- as.numeric(as.character(powerdata_sub$Sub_metering_3) )
powerdata_sub$DateTime<- as.POSIXct(paste(powerdata_sub$Date,powerdata_sub$Time, format="%Y-%m-%d %H:%M:%S"))

rm(powerdata_full)



#Creates graph for Plot4
png("plot4.png")
par(mfrow=c(2,2))
par(mar=c(4.5,5,4.5,2))
plot(powerdata_sub$DateTime,powerdata_sub$Global_active_power, type="l",xlab="", ylab="Global Active Power")
par(mar=c(4.5,5,4.5,2))
plot (powerdata_sub$DateTime,powerdata_sub$Voltage, type="l",xlab="datetime", ylab="Voltage")
par(mar=c(4.5,5,4.5,2))
plot(powerdata_sub$DateTime,powerdata_sub$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(powerdata_sub$DateTime,powerdata_sub$Sub_metering_2, type="l", col="red")
lines(powerdata_sub$DateTime,powerdata_sub$Sub_metering_3, type="l", col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=2, cex=0.75, bty="n")
par(mar=c(4.5,5,4.5,2))
plot(powerdata_sub$DateTime,powerdata_sub$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()