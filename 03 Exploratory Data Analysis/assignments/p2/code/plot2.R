library(dplyr)

## converting NEI to tbl_df for faster processing using dplyr

ndf <- tbl_df(NEI)

ey <- ndf %>%
        filter(fips==24510) %>%
        group_by(year) %>%
        summarise(emission=sum(Emissions))

y <- ey$emission
x <- ey$year

png(file="../plots/plot2.png",height=480,width=480)

plot(x,y,xlab="Year",ylab="Emissions (tons)",main="Total Emissions by Year (1999 - 2008) for Baltimore City",sub="* data for some years not present",type="l",yaxt="n",xlim=c(1998,2010),lty=2)
text(x,y,format(round(y,3),nsmall=3),cex=.7,pos=4,col="red")
axis(2,las=2)
abline(v=c(x),lty=3,col="blue")
points(ey,pch=19,cex=.8)

dev.off()
