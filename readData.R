colClasses_fread<-c("DateDDMMYYYY", "TimeString", "NumericOptional", "NumericOptional", "NumericOptional", "NumericOptional", "NumericOptional", "NumericOptional", "NumericOptional" )
colClasses_read_table<-c("DateDDMMYYYY", "TimeString")
setClass('DateDDMMYYYY')
setAs("character","DateDDMMYYYY", function(from) {as.Date(from, format="%d/%m/%Y")})
setClass('TimeString')
setAs("character","TimeString", function(from) {sapply(from, function(v) {strptime(v, format="%H:%M:%S")})})
setClass('NumericOptional')
setAs("character","NumericOptional", 
      function(from) {
        sapply(from, function(v) {
        if (is.na(v) || v=="?") {
          as.numeric(NA)
        } 
        else {
          as.numeric(v)
          }
        })})
        


dataTable <- fread(
  "data/household_power_consumption.txt", 
  header = TRUE,
  sep=c(";"), 
  na.strings=c("?"), 
  colClasses=colClasses_fread,
  verbose=TRUE)

dataFrame <- read.table(
  "data/household_power_consumption.txt", 
  header = TRUE,
  sep=c(";"), 
  na.strings=c("?"), 
  colClasses=colClasses_read_table
  )
