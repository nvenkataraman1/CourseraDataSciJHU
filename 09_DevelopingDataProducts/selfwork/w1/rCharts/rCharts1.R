require(rCharts)
require(slidify)

haireye <- as.data.frame(HairEyeColor)

n1 <- nPlot(
        Freq ~ Hair, group = "Eye", type = "multiBarChart",
        data = subset(haireye, Sex = "Male")
    )

n1$save('fig/n1.html', cdn = TRUE)

cat('<iframe src="fig/n1.html" width=100% height=600></iframe>')

## Eg 2 - points

names(iris) = gsub("\\.","",names(iris))

r1 <- rPlot(
        SepalLength ~ SepalWidth | Species, data = iris, color = 'Species'
        , type = 'point'
    )

r1$save('fig/r1.html', cdn = TRUE)

cat('<iframe src="fig/r1.html" width=100% height=600></iframe>')

## Eg 3 - bar plot

names(iris) = gsub("\\.","",names(iris))

r2 <- rPlot(
    Freq ~ Hair | Eye, data = haireye, color = 'Eye'
    , type = 'bar'
)

r2$save('fig/r2.html', cdn = TRUE)

cat('<iframe src="fig/r2.html" width=100% height=600></iframe>')

## Eg 4 - using morris

data(economics, package="ggplot2")

econ <- transform(economics, date = as.character(date))

m1 <- mPlot(x = "date", y = c("psavert","uempmed"), type = "Line", data=econ)

m1$set(pointSize = 0, lineWidth = 1)

m1$save("fig/m1.html", cdn = TRUE)

cat('<iframe src="fig/m1.html" width=100% height=600></iframe>')

#manipulate:::