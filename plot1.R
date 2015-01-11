source("readData.R")
hist(
  dataTable$Global_active_power, 
  col="red",
  main="Global Active Power", 
  xlab="Global Active Power (kilowatts)", 
  ylab="Frequency")

if (!file.exists("out/")) {
  dir.create("out")
}

dev.copy(png, file="out/plot1.png", width=504, height=504)
dev.off()
