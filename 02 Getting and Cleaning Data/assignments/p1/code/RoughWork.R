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