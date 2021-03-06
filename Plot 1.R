plot1<-function(){

  #Open png
  png(filename = "Plot 1.png")  
  
  #Read data (specific to date) to power
  nom<-c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
  power<-read.csv2("household_power_consumption.txt",skip=66636, nrows=2881, col.names=nom, stringsAsFactors=FALSE)
  
  #Make plot
  hist(as.numeric(power$Global_Active_Power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

  #Close and save png
  dev.off()

}