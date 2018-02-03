
############################## read data, remove abnormal points ##################
dat = read.csv("BodyFat.csv")
datset = dat[-c(39,42,182),-c(1,3)]


############################# forward, backward and stepwise variable selection ######################

# build a full model including all independent variables
rg_full = lm(BODYFAT~.,data = datset)

# build a base model including 0 independent variable
base<-lm(BODYFAT~1,data=datset)

#### Backward variables selection process using AIC and BIC criterias ####
# model.AIC is the best model chosen by AIC using backward method
model.AIC<-step(rg_full,direction="backward",k=2,trace = 0)
# model.BIC is the best model chosen by BIC using backward method
model.BIC<-step(rg_full,direction="backward",k=log(dim(datset)[1]),trace = 0)

#### stepwise variables selection process using AIC and BIC criterias ####
# base.AIC is the best model chosen by AIC using stepwise method
base.AIC<-step(base,direction="both",scope=list(lower=~1,upper=rg_full),trace=0)
# base.BIC is the best model chosen by BIC using stepwise method
base.BIC<-step(base,direction="both",scope=list(lower=~1,upper=rg_full),trace=0,k=log(dim(datset)[1]))

#### forward variables selection process using AIC and BIC criterias ####
# base.AIC.forward is the best model chosen by AIC using forward method
base.AIC.forward<-step(base,direction="forward",scope=list(lower=~1,upper=rg_full),trace=0)
# base.BIC.forward is the best model chosen by BIC using forward method
base.BIC.forward<-step(base,direction="forward",scope=list(lower=~1,upper=rg_full),trace=0,k=log(dim(datset)[1]))

# stepwise and forward will give the same best model, so we skip *.forward models

# take a look at all 4 best models
summary(model.AIC)
summary(model.BIC)
summary(base.AIC)
summary(base.BIC)
