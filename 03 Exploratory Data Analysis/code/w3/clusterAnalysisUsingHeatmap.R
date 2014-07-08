source("kmeansClustering.R")

set.seed(1234)

x <- rnorm(12, mean= rep(1:3,each=4), sd=.2)

y <- rnorm(12, mean= rep(c(1,2,1),each=4), sd =.2)

dataFrame <- data.frame(x,y)

dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")