library(dplyr)

## converting NEI to tbl_df for faster processing using dplyr

ndf <- tbl_df(NEI)

## using group by year and summarise to get sum(emissions) by year
ey <- summarise(group_by(ndf,year),emission=sum(Emissions))

y <- ey$emission/1000000
x <- ey$year

## plotting the graph

png(file="../plots/plot1.png",height=480,width=480)

## plot sample 3: with labels

plot(x,y,xlab="Year",ylab="Emissions (million tons)",main="Total Emissions by Year (1999 - 2008)",sub="* data for some years not present",type="l",yaxt="n",xlim=c(1998,2010),lty=2)
text(x,y,format(round(y,4),nsmall=4),cex=.7,pos=1,col="red")
axis(2,las=2)
abline(v=c(x),lty=3,col="blue")
points(x,pch=19,cex=.8)

dev.off()