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


png("plot3.png" , width = 480, height = 480,units="px",bg = "transparent");
#one graph
par(mfrow=c(1,1))

plot(as.numeric(as.character(hpc2days$Sub_metering_1)), type="l", ylab = "Energy sub metering",xlab="",xaxt = "n", col="black")
lines(as.numeric(as.character(hpc2days$Sub_metering_2)), type="l", col="red")
lines(as.numeric(as.character(hpc2days$Sub_metering_3)), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),# puts text in the legend
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5, 2.5),
       col=c("black", "red", "blue")) # gives the legend lines the correct color and width

axis(side = 1,
     at =  c(0,nrow(hpc1),nrow(hpc2days)),
     labels = c("Thu", "Fri", "Sat"),
     tck=-.05)
dev.off()