set.seed(1)
rpois(5, 2)

set.seed(10)
x1 <- rbinom(10, 10, 0.5)
x2 <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()