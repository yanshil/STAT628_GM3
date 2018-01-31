BodyFat <- read.csv("./data/BodyFat.csv")

attach(BodyFat)

## Delete abnormal point
d1 <- BodyFat[-c(182,42),]
## Delete Influential Point
d2 <- BodyFat[-c(182,42,39),]
d3 <- BodyFat[-c(182,42,79),]

fit1 <- lm(BODYFAT~.-IDNO-DENSITY,data = d1)
summary(fit1)

par(mfrow=c(2,2))
plot(fit1)

fit2 <- lm(BODYFAT~.-IDNO-DENSITY,data = d2)
plot(fit2)
# ID39 is an leverage point

fit3 <- lm(BODYFAT~.-IDNO-DENSITY,data = d3)
plot(fit3)

## Choose to delete 39
library(MASS)
# step2_aic <- stepAIC(fit2, direction="both")
# step2_aic$anova
## BODYFAT ~ AGE + ADIPOSITY + NECK + CHEST + ABDOMEN + HIP + FOREARM + WRIST
step(fit2, direction = "both", k = 2)
# lm(formula = BODYFAT ~ AGE + ADIPOSITY + NECK + CHEST + ABDOMEN + HIP + FOREARM + WRIST, data = d2)
step(fit1, direction = "both", k = 2)
# lm(formula = BODYFAT ~ AGE + WEIGHT + NECK + ABDOMEN + HIP + THIGH + FOREARM + WRIST, data = d1)

# library(leaps)
# lps <- regsubsets(BODYFAT~.-IDNO-DENSITY,data = d2,nbest = 1)
# summary(lps)
# par(mfrow=c(1,1))
# plot(lps,scale = "bic")

# AIC and BIC
n <- dim(d2)[1]
step(fit2, direction = "both", k = log(n))
# lm(formula = BODYFAT ~ AGE + ADIPOSITY + CHEST + ABDOMEN + WRIST, data = d2)
step(fit1, direction = "both", k = log(n))
bic1 <- lm(formula = BODYFAT ~ WEIGHT + ABDOMEN + FOREARM + WRIST, data = d1)

# fitaic <- lm(BODYFAT ~ AGE + ADIPOSITY + NECK + CHEST + ABDOMEN + HIP + FOREARM + WRIST, data = d2)
# summary(fitaic)
# 
# fitbic <- lm(BODYFAT~WEIGHT+ABDOMEN+WRIST,data = d2)
# summary(fitbic)

fit <- lm(BODYFAT~.-IDNO-DENSITY-ADIPOSITY,data = d2)
step(fit, direction = "both", k = log(n))

d0 <- cbind(d2, BMI = d2$WEIGHT/d2$HEIGHT^2*703)

fit0 <- lm(BODYFAT~.-IDNO-DENSITY-ADIPOSITY,data = d0)
step(fit0, direction = "both", k = log(n))

fit00 <- lm(BODYFAT~.-IDNO-DENSITY,data = d0)
step(fit00, direction = "both", k = log(n))
