
############################### Get the final model #############
dat = read.csv("BodyFat.csv")
datset = dat[-c(39,42,182),-c(1,3)]
base.BIC<-lm(formula = BODYFAT ~ ABDOMEN + WEIGHT + WRIST, data = datset)

### residual plot, qqplot and influential points plot ############ 
par(mfrow = c(2,2))
plot(base.BIC)

### calculate VIF for this model ###
library(car)
sqrt(vif(base.BIC))

### plot correlation between
library(corrplot)
par(mfrow = c(1,1))
M = datset[,-1]
corM = cor(M)
corrplot(corM, method = "circle")