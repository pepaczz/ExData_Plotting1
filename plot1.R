# setwd("C:/_Rs/Coursera/04_Exploratory_Data_Analysis")

data <- read.table(file = "household_power_consumption.txt",sep=";",
                   stringsAsFactors = F,header = T,dec=".",na.strings = "?")
data0 <- data[66637:69516,]
data1 <- data0
data1["DateTime"] <- as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data2 <- data1[!names(data1) %in% c("Date","Time")]

## PLOT 1
hist(data2$Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
