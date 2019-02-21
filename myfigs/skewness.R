library(fGarch)
library(extrafont)

loadfonts(quiet = TRUE)

rm(list = ls())

set.seed(1234)

svg("myfigs/skewness.svg", family = "Open Sans", width = 12, height = 4)

par(mfrow = c(1, 3))

x <- rsnorm(n = 1000, xi = -4)
hist(x, n = 25, probability = TRUE, border = "white", col = "gray25", main = "Negatively skewed")
lines(density(x), col = "red", lwd = 2)
box()

x <- rnorm(n = 1000)
hist(x, n = 25, probability = TRUE, border = "white", col = "gray25", main = "Not skewed")
lines(density(x), col = "red", lwd = 2)
box()

x <- rsnorm(n = 1000, xi = 4)
hist(x, n = 25, probability = TRUE, border = "white", col = "gray25", main = "Positively skewed")
lines(density(x), col = "red", lwd = 2)
box()

dev.off()