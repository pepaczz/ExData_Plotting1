# setwd("C:/_Rs/Coursera/04_Exploratory_Data_Analysis")

data <- read.table(file = "household_power_consumption.txt",sep=";",
                   stringsAsFactors = F,header = T,dec=".",na.strings = "?")
data0 <- data[66637:69516,]
data1 <- data0
data1["DateTime"] <- as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data2 <- data1[!names(data1) %in% c("Date","Time")]

## PLOT 4
# Sys.setlocale("LC_TIME", "C")   #-- used to force english language locale 
png(file='plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

plot(data2$DateTime,
     data2$Global_active_power,
     col="black",
     xlab="",
     ylab="Global Active Power",
     type="l")

plot(data2$DateTime,
     data2$Voltage,
     col="black",
     xlab="datetime",
     ylab="Voltage",
     type="l")

plot(data2$DateTime,
     data2$Sub_metering_1,
     col="black",
     ylab="Energy sub metering",
     xlab="",
     type="l",
     mar=c(0.5,0.5,0.5,0.5))
lines(data2$DateTime,data2$Sub_metering_2,col="red")
lines(data2$DateTime,data2$Sub_metering_3,col="blue")
legend(x="topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       lwd = 2,
       cex=0.5)

plot(data2$DateTime,
     data2$Global_reactive_power,
     col="black",
     ylab="Global_Reactive_Power",
     xlab="datetime",
     type="l")

dev.off()

