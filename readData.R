# load data into memory

require("data.table")
library(data.table)

if (!file.exists("data/")) {
  dir.create("data")
}

dataFile <- "data/household_power_consumption.txt";
if (!file.exists(dataFile)) {
  destFile <- "data/household_power_consumption.zip";
  if (!file.exists(destFile)) {
    dataFileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
    
    # remove "method" parameter in the line below if running on Windows
    download.file(dataFileUrl, destfile=destFile, method="curl")
  }
  unzip(destFile, exdir="./data/")
}

# fread can't deal with '?' in numeric columns, load data as strings and then convert
# read.csv2 is much slower
colClasses_fread_numeric_as_string<-c("character", "character", "character", "character", "character", "character", "character", "character", "character" )
dataTable <- fread(
  "data/household_power_consumption.txt", 
  header = TRUE,
  sep=c(";"),  
  na.strings=c("?"), 
  colClasses=colClasses_fread_numeric_as_string);

# coerce Date column to Date  
dataTable[,Date:=as.Date(Date,format="%d/%m/%Y")];

# filter data, keep only what's needed
dataTable<-dataTable[Date<="2007-02-02"][Date>="2007-02-01"]

# coerce the rest of the data columns
dataTable[,Time:=lapply(paste(Date, Time), function(v) strptime(v, format="%Y-%m-%d %H:%M:%S"))  ]
# is there a way to coerce all numeric columns in one call? for now do this one-by-one
dataTable[,Global_active_power:=as.numeric(Global_active_power)];
dataTable[,Global_intensity:=as.numeric(Global_intensity)];
dataTable[,Global_reactive_power:=as.numeric(Global_reactive_power)];
dataTable[,Sub_metering_1:=as.numeric(Sub_metering_1)];
dataTable[,Sub_metering_2:=as.numeric(Sub_metering_2)];
dataTable[,Sub_metering_3:=as.numeric(Sub_metering_3)];
dataTable[,Voltage:=as.numeric(Voltage)];

