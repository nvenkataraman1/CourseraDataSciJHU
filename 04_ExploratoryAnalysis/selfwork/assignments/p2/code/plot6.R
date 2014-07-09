library(dplyr)
library(ggplot2)

## change names of columns for easy reading - strictly optional
names(SCC) <- c("scc","datacategory","shortname","eisector",
                "optiongroup","optionset","scc1","scc2",
                "scc3","scc4","mapto","lastinvyr","createddate",
                "reviseddate", "usagenotes")

## grep SCC$eisector using combustion / coal strings
## returns a factor vector
onroad <- SCC$scc[grep("Vehicle.*|.*Vehicle", SCC$eisector, ignore.case=FALSE)]

ndf <- tbl_df(NEI)

## filter ndf using factor vector with SCC numbers
ey <- ndf %>%
    filter(fips == "24510" | fips == "06037", SCC %in% onroad) %>%
    group_by(fips,year) %>%
    summarise(emission=sum(Emissions))

ey <- ey %>%
        mutate(city = ifelse(fips=="06037","Los Angeles County","Baltimore City"))

y <- ey$emission
x <- factor(ey$year)

## plotting the graph
png(file="../plots/plot6.png",height=480,width=480)

## base plot
p <- ggplot(ey,aes(x=x,y=y,group=1))

## plotting lines, points
p <- p + 
    geom_line() + 
    geom_point(size=3)

## plotting axes and data point labels
p <- p + 
    geom_text(size=3,aes(y=y+40,label=round(y,1))) + 
    xlab("Year") +
    ylab("Emissions (tons)") + 
    facet_grid(city ~ ., scales="free_y")

## plotting chart title
p <- p + ggtitle("Emissions from Onroad sources\nBaltimore City vs Los Angeles County\n(1999 - 2008)\n")

print(p)

dev.off()