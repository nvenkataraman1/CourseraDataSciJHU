
## Read data into dataframe
hpc <- read.csv("./assignments/p1/data/filtereddata.csv",header=TRUE,stringsAsFactors=FALSE)

hpc <- cbind(hpc,as.POSIXlt(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S"))
names(hpc)[10] <- c("datetime")

## writing to png graphics device to avoid appending multiple plots
png(file="plot3.png")

## Plot 3

plot(as.POSIXlt(hpc$datetime),hpc$Global_active_power,ylim=c(0,40),type="n",xlab="",ylab="Energy sub metering")
lines(as.POSIXlt(hpc$datetime),hpc$Sub_metering_1,col="black")
lines(as.POSIXlt(hpc$datetime),hpc$Sub_metering_2,col="red")
lines(as.POSIXlt(hpc$datetime),hpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))

# switch off graphics device
dev.off()