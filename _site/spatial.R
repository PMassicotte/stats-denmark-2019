mtcars2 <- mutate(mtcars, dummy = 1)

mod1 <- lm(mpg ~ drat, data = mtcars2)
mod2 <- nlme::lme(mpg ~ drat, random = ~ 1 | dummy, data = mtcars2)

AIC(mod1, mod2)

piecewiseSEM::rsquared(list(mod1, mod2))

install.packages("nlme")
library(nlme)
spdata <- read.table("https://stats.idre.ucla.edu/stat/r/faq/thick.csv", header = T, sep = ",")

dummy <- rep(1, 75)
spdata <- cbind(spdata, dummy)
null.model <- lme(fixed = thick ~ soil, data = spdata, random = ~ 1 | dummy)
summary(null.model)

exp.sp <- update(null.model, correlation = corExp(1, form = ~ east + north), method = "ML")

piecewiseSEM::rsquared(list(mod1, mod2, exp.sp))

soil.model <- lme(fixed = thick ~ soil, data = spdata, random = ~ 1 | dummy, method = "ML") 
piecewiseSEM::rsquared(list(mod1, mod2, soil.model))

soil.gau <- update(soil.model, correlation = corGaus(1, form = ~ east + north), method = "ML")
piecewiseSEM::rsquared(list(mod1, mod2, soil.model, soil.gau))

AIC(soil.model, soil.gau)
