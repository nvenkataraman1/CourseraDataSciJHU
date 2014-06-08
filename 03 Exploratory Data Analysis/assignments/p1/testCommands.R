format(paste(hpc[1,1],hpc[1,2]),format="%Y-%m-%d %H:%M:%S")

hpc <- cbind(hpc,as.POSIXlt(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S"))

## Plot 1
hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##weekdays(as.POSIXlt(hpc$datetime))

## Plot 2
plot(as.POSIXlt(hpc$datetime),hpc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")

lines(as.POSIXlt(hpc$datetime),hpc$Global_active_power)

## Plot 3

plot(as.POSIXlt(hpc$datetime),hpc$Global_active_power,ylim=c(0,40),type="n",xlab="",ylab="Energy sub metering")
lines(as.POSIXlt(hpc$datetime),hpc$Sub_metering_1,col="black")
lines(as.POSIXlt(hpc$datetime),hpc$Sub_metering_2,col="red")
lines(as.POSIXlt(hpc$datetime),hpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))


