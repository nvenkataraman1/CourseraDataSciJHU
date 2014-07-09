## Activities
activityLabels <- read.fwf(
    file="./data/UCI HAR Dataset/activity_labels.txt",
    widths=c(1, 18))

names(activityLabels)[1] <- "srno"

names(activityLabels)[2] <- "activity"

## Features
features <- read.fwf(
    file="./data/UCI HAR Dataset/features.txt",
    widths=c(3, 36))

names(features) <- c("srno","feature")

## custom quantiles
quantile(jpgfile,probs=c(.3,.8))

#### Code for answers to Quiz 3

## Quiz 3 - Q 5

gdp_merge$gdpquant <- cut2(gdp_merge$V2,g=5)
table(gdp_merge$gdpquant,gdp_merge$Income.Group)