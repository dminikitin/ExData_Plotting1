#source("readData.R")

par(mfrow=c(2,2))
plot(dataTable$Global_active_power, 
     type="l", 
     ylab="Global Active Power", 
     xlab=NA
)
plot(dataTable$Voltage, 
     type="l", 
     ylab="Voltage", 
     xlab="datetime"
)

plot(dataTable$Sub_metering_1 ,main=NA, xlab=NA, ylab="Energy Sub Metering", type="n")
points(dataTable$Sub_metering_1, type="l")
points(dataTable$Sub_metering_2, type="l",col="red")
points(dataTable$Sub_metering_3, type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), bty="n")

plot(dataTable$Global_reactive_power, 
     type="l", 
     ylab="Global_reactive_power", 
     xlab="datetime"
)


dev.copy(png, file="out/plot4.png", width=504, height=504)
dev.off()
