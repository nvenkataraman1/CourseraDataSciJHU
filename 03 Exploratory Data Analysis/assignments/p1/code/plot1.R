## Read data into dataframe
hpc <- read.csv("./assignments/p1/data/filtereddata.csv",header=TRUE,stringsAsFactors=FALSE)

hpc <- cbind(hpc,as.POSIXlt(paste(hpc$Date,hpc$Time),format="%d/%m/%Y %H:%M:%S"))
names(hpc)[10] <- c("datetime")

## writing to png graphics device to avoid appending multiple plots
png(file="plot1.png")

## Plot 1
hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# switch off graphics device
dev.off()