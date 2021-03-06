source("readData.R")

par(mfrow=c(1,1))
plot(
  dataTable$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab=NA
)

dev.copy(png, file="out/plot2.png", width=504, height=504)
dev.off()
