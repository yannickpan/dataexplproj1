##Attention: please clear any already-existed plots
rm(list=ls())
householddata = read.table("household_power_consumption.txt",header=TRUE,sep=";")
colnames(householddata)
usedata = householddata[householddata$Date == '1/2/2007' | householddata$Date == '2/2/2007',]
dim(usedata)
rm(householddata)
usedata$Global_active_power = as.numeric(as.character(usedata$Global_active_power))
##transfer the current date format as a formal one
usedata$Date = as.POSIXct(usedata$Date,format='%d/%m/%Y')
usedata$weekdays = weekdays(as.Date(usedata$Date))
usedata$DateandTime = paste(usedata$Date,usedata$Time)
usedata$DateandTime = strptime(usedata$DateandTime, "%Y-%m-%d %H:%M:%S")
##draw the comprehensive plot
par(mfrow = c(2, 2))
with(usedata, {
  plot(as.ts(Time), Global_active_power, main = "time and global active power",xaxt="n",type="l")
  axis(side=1, at=c(1,1441),labels=c("Thursday","Friday"))
  plot(as.ts(Time), Voltage, main = "time and voltage",xaxt="n",type="l")
  axis(side=1, at=c(1,1441),labels=c("Thursday","Friday"))
  plot(as.ts(Time), Sub_metering_1, main = "time and energy_sub_metering",xaxt="n",type="l") 
  with(usedata,points(x=as.ts(Time),y=Sub_metering_2,col="red",type="l"))
  with(usedata,points(x=as.ts(Time),y=Sub_metering_3,col="blue",type="l"))
  axis(side=1, at=c(1,1441),labels=c("Thursday","Friday"))
  legend("topright",lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col = c("black","red", "blue"), cex=0.6,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(as.ts(Time), Global_reactive_power, main = "time and global reactive power",xaxt="n",type="l") 
  axis(side=1, at=c(1,1441),labels=c("Thursday","Friday"))
  mtext("Time and household energy use", outer = TRUE)
})