#install.packages("RCurl")
#install.packages("bitops")
library(RCurl)
library(bitops)

#if(!file.exists("exdata-data-household_power_consumption.zip")){
#  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#  download.file(fileUrl, destfile = "exdata-data-household_power_consumption.zip", method = "curl")
#  unzip("exdata-data-household_power_consumption.zip")
#}

hpc <- read.table('household_power_consumption.txt', sep = ";", header=TRUE)
hpc1 <- subset(hpc, Date == '1/2/2007')
hpc2 <- subset(hpc, Date == '2/2/2007')
hpc2days=rbind(hpc1, hpc2)



png("plot4.png" , width = 480, height = 480,units="px",bg = "transparent");

#4 graphs
par(mfrow=c(2,2))


#PLOT 1
plot(as.numeric(as.character(hpc2days$Global_active_power)), type="l", ylab = "Global Active Power (kilowatts)",xlab="",xaxt = "n")
axis(side = 1,
     at =  c(0,nrow(hpc1),nrow(hpc2days)),
     labels = c("Thu", "Fri", "Sat"),
     tck=-.05)


#PLOT 2
plot(as.numeric(as.character(hpc2days$Voltage)), type="l", ylab = "Voltage",xlab="datetime",xaxt = "n")
axis(side = 1,
     at =  c(0,nrow(hpc1),nrow(hpc2days)),
     labels = c("Thu", "Fri", "Sat"),
     tck=-.05)


#PLOT 3
plot(as.numeric(as.character(hpc2days$Sub_metering_1)), type="l", ylab = "Energy sub metering",
     xlab="", #remove label on X axis
     xaxt = "n", #remove numbers on x axis
     col="black")
lines(as.numeric(as.character(hpc2days$Sub_metering_2)), type="l", col="red")
lines(as.numeric(as.character(hpc2days$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),# puts text in the legend
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5, 2.5),
       col=c("black", "red", "blue"), # gives the legend lines the correct color and width
       bty = "n")#remove border
axis(side = 1,
     at =  c(0,nrow(hpc1),nrow(hpc2days)),
     labels = c("Thu", "Fri", "Sat"),
     tck=-.05)


#PLOT 4
plot(as.numeric(as.character(hpc2days$Global_reactive_power)), type="l", ylab = "Global_reactive_power",xlab="datetime",xaxt = "n")
axis(side = 1,
     at =  c(0,nrow(hpc1),nrow(hpc2days)),
     labels = c("Thu", "Fri", "Sat"),
     tck=-.05)

dev.off()