library(datasets)
data(iris)

iris

x <- split(iris, iris$Species)
x

lapply(x, function(x) mean(x[,c("Sepal.Length")]))

colMeans(iris)
apply(iris, 2, mean)
apply(iris[, 1:4], 1, mean)
apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
mtcars

sapply(mtcars, cyl, mean)
mean(mtcars$mpg, mtcars$cyl)
lapply(mtcars, mean)
split(mtcars, mtcars$cyl)
apply(mtcars, 2, mean)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$cyl, mtcars$mpg, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(mtcars$hp, mtcars$cyl, mean)
209.21429 - 82.63636

debug(ls)
ls

