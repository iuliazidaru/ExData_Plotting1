#install.packages("RCurl")
#install.packages("bitops")
library(RCurl)
library(bitops)

if(!file.exists("exdata-data-household_power_consumption.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "exdata-data-household_power_consumption.zip", method = "curl")
  unzip("exdata-data-household_power_consumption.zip")
}

hpc <- read.table('household_power_consumption.txt', sep = ";", header=TRUE)
hpc1 <- subset(hpc, Date == '1/2/2007')
hpc2 <- subset(hpc, Date == '2/2/2007')
hpc2days=rbind(hpc1, hpc2)





png("plot1.png" , width = 480, height = 480,units="px",bg = "transparent")
#one graph
par(mfrow=c(1,1))
hist(as.numeric(as.character(hpc2days$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()