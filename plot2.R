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



#Creates graph for Plot2
png("plot2.png")
par(mar=c(4.5,5,4.5,2))
plot(powerdata_sub$DateTime, powerdata_sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
