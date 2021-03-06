plot4<-function(){
  
  #Open png
  png(filename = "Plot 4.png")  
  
  #Set png dimensions
  par(mfrow=c(2,2))
  
  #Read data (specific to date) to power and save datetime to DT
  nom<-c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
  power<-read.csv2("household_power_consumption.txt",skip=66636, nrows=2881, col.names=nom, stringsAsFactors=FALSE)
  DT<-strptime(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")
  
  #1st plot
  plot(DT,as.numeric(power$Global_Active_Power), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #2nd plot
  plot(DT,as.numeric(power$Voltage), type="l", xlab = "datetime", ylab = "Voltage")
  
  #3rd plot
  plot(DT,as.numeric(power$Sub_Metering_1), type="l", xlab = "", ylab = "Energy sub metering")
  points(DT,as.numeric(power$Sub_Metering_2), type="l", col="red")
  points(DT,as.numeric(power$Sub_Metering_3), type="l", col="blue")
  legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black", "red", "blue"), lwd=1)
  
  #4th plot
  plot(DT,as.numeric(power$Global_Reactive_Power), type="l", xlab = "datetime", ylab = "Global Reactive Power")
  
  #Close and save png
  dev.off()
  
}