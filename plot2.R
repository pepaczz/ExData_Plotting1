# setwd("C:/_Rs/Coursera/04_Exploratory_Data_Analysis")

data <- read.table(file = "household_power_consumption.txt",sep=";",
                   stringsAsFactors = F,header = T,dec=".",na.strings = "?")
data0 <- data[66637:69516,]
data1 <- data0
data1["DateTime"] <- as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data2 <- data1[!names(data1) %in% c("Date","Time")]

## PLOT 2
# Sys.setlocale("LC_TIME", "C")   #-- used to force english language locale 
plot(data2$DateTime,
     data2$Global_active_power,
     col="black",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l")
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()
