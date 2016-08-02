plot2<-function(){
  
  #Open png
  png(filename = "Plot 2.png")  
  
  #Read data (specific to date) to power and save datetime to DT
  nom<-c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")
  power<-read.csv2("household_power_consumption.txt",skip=66636, nrows=2881, col.names=nom, stringsAsFactors=FALSE)
  DT<-strptime(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")
  
  #Make plot
  plot(DT,as.numeric(power$Global_Active_Power), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #Close and save png
  dev.off()
  
}