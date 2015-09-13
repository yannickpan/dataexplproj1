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
##colors can be defined by: colors = c("orange","blue", "pink", "cyan"); 
##draw the first required plot
hist(usedata$Global_active_power,xlab = "Global Active Power", ylab="Frequency",main="Global Active Power",col="red")

