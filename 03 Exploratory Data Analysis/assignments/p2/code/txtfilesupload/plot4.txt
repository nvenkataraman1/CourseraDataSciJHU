library(dplyr)
library(ggplot2)

## change names of columns for easy reading - strictly optional
names(SCC) <- c("scc","datacategory","shortname","eisector",
                    "optiongroup","optionset","scc1","scc2",
                    "scc3","scc4","mapto","lastinvyr","createddate",
                    "reviseddate", "usagenotes")

## grep SCC$eisector using combustion / coal strings
## returns a factor vector
coal <- SCC$scc[grep("Comb.*Coal|Coal.*Comb", SCC$eisector, ignore.case=FALSE)]

## filter NEI using factor vector with SCC numbers
ey <- NEI %>%
        filter(SCC %in% coal) %>%
        group_by(year) %>%
        summarise(emission=sum(Emissions))

y <- ey$emission/1000
x <- factor(ey$year)

## plotting the graph
png(file="../plots/plot4.png",height=480,width=480)

## base plot
p <- ggplot(ey,aes(x=x,y=y,group=1))

## plotting lines, points
p <- p + 
        geom_line() + 
        geom_point(size=3) + 
        ylim(300,600)

## plotting axes and data point labels
p <- p + 
        geom_text(size=3,aes(y=y-10,label=round(y,1))) + 
        xlab("Year") +
        ylab("Emissions ('000 tons)")

## plotting chart title
p <- p + ggtitle("Emissions from Coal Combustion sources\n(1999 - 2008)\n")

print(p)

dev.off()