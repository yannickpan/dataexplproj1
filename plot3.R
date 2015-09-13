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

with(usedata,plot(x=as.ts(Time),y=Sub_metering_1,col="black",type="l",xlab="time",ylab="energe sub metering",xaxt="n"))
with(usedata,points(x=as.ts(Time),y=Sub_metering_2,col="red",type="l"))
with(usedata,points(x=as.ts(Time),y=Sub_metering_3,col="blue",type="l"))
axis(side=1, at=c(1,1441),labels=c("Thursday","Friday"))
legend("topright",lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
