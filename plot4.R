library(data.table)
setwd("~/RHome/data/Project1")

dataset <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
inscope_data <- dataset[as.character(dataset$Date) %in% c('2/2/2007','1/2/2007'),]
inscope_data$DateTime <- strptime(paste(inscope_data$Date,inscope_data$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=480,height=480,units="px",bg=NA)
par(mfrow = c(2,2))
plot(x=inscope_data$DateTime,y=inscope_data$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power")

plot(x=inscope_data$DateTime,y=inscope_data$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage")

plot(x=inscope_data$DateTime,y=inscope_data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")

lines(x=inscope_data$DateTime,y=inscope_data$Sub_metering_2,type="l",col="red")
lines(x=inscope_data$DateTime,y=inscope_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=1,bty="n",col=c("black","red","blue"))

plot(x=inscope_data$DateTime,y=inscope_data$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")
dev.off()