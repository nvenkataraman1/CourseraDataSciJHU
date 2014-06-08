
## Read data into dataframe
hpc <- read.csv("./assignments/p1/data/filtereddata.csv",header=TRUE,stringsAsFactors=FALSE)

hpc <- cbind(hpc,as.POSIXlt(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S"))
names(hpc)[10] <- c("datetime")

## writing to png graphics device to avoid appending multiple plots
png(file="plot4.png")

par(mfcol = c(2,2))
with(hpc, {
    
    ## Plot 4 - top left (plot 2)
    plot(as.POSIXlt(datetime),Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
    lines(as.POSIXlt(datetime),Global_active_power)
    
    ## Plot 4 - bottom left (plot 3)
    
    plot(as.POSIXlt(datetime),Global_active_power,ylim=c(0,37.5),type="n",xlab="",ylab="Energy sub metering")
    lines(as.POSIXlt(datetime),Sub_metering_1,col="black")
    lines(as.POSIXlt(datetime),Sub_metering_2,col="red")
    lines(as.POSIXlt(datetime),Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lwd=c(0),lty=c(1,1,1),col=c("black","red","blue"),cex=.6)
    
    ## Plot 4 - top right
    
    plot(as.POSIXlt(datetime),Voltage,type="n",xlab="",ylab="Voltage")
    lines(as.POSIXlt(datetime),Voltage)
    
    ## Plot 4 - bottom right
    
    plot(as.POSIXlt(datetime),Global_reactive_power,type="n",xlab="",ylab="Global_reactive_power")
    lines(as.POSIXlt(datetime),Global_reactive_power)
})

# switch off graphics device
dev.off()