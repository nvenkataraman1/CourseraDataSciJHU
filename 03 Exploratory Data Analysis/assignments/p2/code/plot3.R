library(dplyr)
library(ggplot2)

## converting NEI to tbl_df for faster processing using dplyr

ndf <- tbl_df(NEI)

ey <- ndf %>%
        filter(fips==24510) %>%
        group_by(type,year) %>%
        summarise(emission=sum(Emissions))

## plotting the graph
png(file="../plots/plot3.png",height=480,width=480)

## base plot
p <- ggplot(ey,aes(x=year,y=emission,colour=type))

## adding elements
p <- p + 
    geom_line() + 
    geom_point(size=3) + 
    geom_text(size=3,aes(y=ey$emission+75,label=round(emission,1))) + 
    facet_grid(type ~ ., scales="free_y")

print(p)

dev.off()