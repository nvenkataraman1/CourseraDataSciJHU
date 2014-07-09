
## Read data into dataframe
hpc <- read.csv("./assignments/p1/data/filtereddata.csv",header=TRUE,stringsAsFactors=FALSE)

hpc <- cbind(hpc,as.POSIXlt(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S"))
names(hpc)[10] <- c("datetime")

## writing to png graphics device to avoid appending multiple plots
png(file="plot2.png")

## Plot 2
plot(as.POSIXlt(hpc$datetime),hpc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(as.POSIXlt(hpc$datetime),hpc$Global_active_power)

# switch off graphics device
dev.off()