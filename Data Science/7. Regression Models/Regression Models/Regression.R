install.packages("swirl")
library(swirl)
swirl()
# install_from_swirl("Regression Models")

# This is the first lesson on Regression Models. We'll begin with the concept of
# | "regression toward the mean" and illustrate it with some pioneering work of the
# | father of forensic science, Sir Francis Galton.

# Sir Francis studied the relationship between heights of parents and their children.
# | His work showed that parents who were taller than average had children who were also
# | tall but closer to the average height. Similarly, parents who were shorter than
# | average had children who were also shorter than average but less so than mom and
# | dad. That is, they were closer to the average height. From one generation to the
# | next the heights moved closer to the average or regressed toward the mean.

plot(child~parent,galton)

# You'll notice that this plot looks a lot different than the original we displayed.
# | Why? Many people are the same height to within measurement error, so points fall on
# | top of one another. You can see that some circles appear darker than others.
# | However, by using R's function "jitter" on the children's heights, we can spread out
# | the data to simulate the measurement errors and make high frequency heights more
# | visible.

plot(jitter(child,4) ~ parent,galton)

# Now for the regression line. This is quite easy in R. The function lm (linear model)
# | needs a "formula" and dataset. You can type "?formula" for more information, but, in
# | simple terms, we just need to specify the dependent variable (children's heights) ~
# | the independent variable (parents' heights).

regrline <- lm(child ~ parent, galton)

# Now add the regression line to the plot with "abline". Make the line wide and red
# | for visibility. Type "abline(regrline, lwd=3, col='red')"

abline(regrline, lwd=3, col='red')

# The regression line will have a slope and intercept which are estimated from data.
# | Estimates are not exact. Their accuracy is gauged by theoretical techniques and
# | expressed in terms of "standard error." You can use "summary(regrline)" to examine
# | the Galton regression line. Do this now.

summary(regrline)

# | The slope of the line is the estimate of the coefficient, or muliplier, of "parent",
# | the independent variable of our data (in this case, the parents' heights). From the
# | output of "summary" what is the slope of the regression line?

# | A coefficient will be within 2 standard errors of its estimate about 95% of the
# | time. This means the slope of our regression is significantly different than either
# | 0 or 1 since (.64629) +/- (2*.04114) is near neither 0 nor 1.