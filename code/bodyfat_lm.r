setwd("C:\\Users\\Peiji\\Desktop\\spring2018\\STAT628\\hw1")
data<-read.csv("BodyFat.csv")
summary(data)
par(mfrow=c(1,2))
for (i in 1:dim(data)[2]){
  plot(data[,i],main=colnames(data[i]))
  hist(data[,i],main=colnames(data[i]))
}

#AGE WEIGHT HEIGHT ADIPOSITY NECK CHEST ABDOMEN   HIP THIGH KNEE ANKLE BICEPS FOREARM WRIST
#46 363.15  72.25      48.9 51.2 136.2   148.1 147.7  87.3 49.1  29.6     45      29  21.4
sub_1<-filter(data,HEIGHT!=29.50 & BODYFAT!=0.00) %>% select(-c(IDNO,DENSITY))
sub_2<-filter(data,HEIGHT!=29.50 & BODYFAT!=0.00 &  WEIGHT!=363.15) %>% select(-c(IDNO,DENSITY))
sub_3<-filter(data,HEIGHT!=29.50 & BODYFAT!=0.00 & AGE!=81.00 & WEIGHT!=363.15) %>% select(-c(IDNO,DENSITY))

m1<-lm(BODYFAT~.,sub_1)
m2<-lm(BODYFAT~.,sub_2)

summary(m1)
summary(m2)


par(mfrow=c(2,2))
plot(m1)
plot(m2)
#205,219,222,39,85
plot(m1, which=4)
abline( h = 4/(249-15),lty=2 )

#±äÁ¿É¸Ñ¡
#1. Mallow CP
library(faraway)
library(leaps)
x<-sub_2[,-1]
y<-sub_2[,1]
par(mfrow=c(1,1))
g<-leaps(x,y,nbest=1)
Cpplot(g)
summary(x)
#1,3,5,7,13,14
#options(repr.plot.width=4, repr.plot.height=3)

#2. AIC,BIC fullmodel backwards
model.AIC<-step(m2,k=2)
model.BIC<-step(m2,k=log(dim(sub_2)[1]))
AIC.choice<-c(1,4,5,6,7,8,13,14)
BIC.choice<-c(1,4,6,7,14)

#3. AIC,BIC stepwise
base<-lm(BODYFAT~1,data=sub_2)
base.AIC<-step(base,direction="both",scope=list(lower=~1,upper=m2),trace=T)
base.BIC<-step(base,direction="both",scope=list(lower=~1,upper=m2),trace=T,k=log(dim(sub_2)[1]))
AIC.base.choice<-c(1,2,7,12,14)
BIC.base.choice<-c(2,7,14)#[1] "WEIGHT"  "ABDOMEN" "WRIST"  














sub_2_BMI<-mutate(sub_2,BMI=WEIGHT*703/(HEIGHT^2))

m2_BMI<-lm(BODYFAT~.,sub_2_BMI)
plot(m2_BMI)
plot(m2_BMI, which=4)
abline( h = 4/(249-15),lty=2 )


library(faraway)
library(leaps)
x<-sub_2[,-1]
y<-sub_2[,1]
par(mfrow=c(1,1))
g<-leaps(x,y,nbest=1)
Cpplot(g)
summary(x)
#1,3,5,7,13,14
#options(repr.plot.width=4, repr.plot.height=3)
plot(m2, which=4)
abline( h = 4/(249-15),lty=2 )

model.AIC<-step(m2,k=2)
model.BIC<-step(m2,k=log(dim(sub_2)[1]))
AIC.choice<-c(1,4,5,6,7,8,13,14)
BIC.choice<-c(1,4,6,7,14)

base<-lm(BODYFAT~1,data=sub_2)
base.AIC<-step(base,direction="both",scope=list(lower=~1,upper=m2),trace=T)
base.BIC<-step(base,direction="both",scope=list(lower=~1,upper=m2),trace=T,k=log(dim(sub_2)[1]))
AIC.base.choice<-c(1,2,7,12,14)
BIC.base.choice<-c(2,7,14)



#==================================BMI=======================================================



sub_2_BMI<-mutate(sub_2,BMI=WEIGHT*703/(HEIGHT^2))

m2_BMI<-lm(BODYFAT~.,sub_2_BMI)
plot(m2_BMI)
plot(m2_BMI, which=4)
abline( h = 4/(249-15),lty=2 )


library(faraway)
library(leaps)
x_BMI<-sub_2_BMI[,-1]
y<-sub_2_BMI[,1]
par(mfrow=c(1,1))
g_BMI<-leaps(x_BMI,y,nbest=1)
Cpplot(g)
summary(x_BMI)
#1,3,5,7,13,14
#options(repr.plot.width=4, repr.plot.height=3)
plot(m2, which=4)
abline( h = 4/(249-15),lty=2 )

model.AIC_BMI<-step(m2_BMI,k=2)
model.BIC_BMI<-step(m2_BMI,k=log(dim(sub_2)[1]))
#AIC.choice_BMI<-c(1,4,5,6,7,8,13,14)
BIC.choice_BMI<-c(1,6,14,15)

base<-lm(BODYFAT~1,data=sub_2_BMI)
base.AIC_BMI<-step(base,direction="both",scope=list(lower=~1,upper=m2),trace=T)
base.BIC_BMI<-step(base,direction="both",scope=list(lower=~1,upper=m2),trace=T,k=log(dim(sub_2_BMI)[1]))
AIC.base.choice<-c(1,2,7,12,14)
BIC.base.choice<-c(2,7,14)

sub_2_BMI<-mutate(sub_2,BMI=WEIGHT*703/(HEIGHT^2))

final.data<-select(sub_2,BODYFAT,ABDOMEN,WEIGHT,WRIST)
final<-lm(BODYFAT~.,final.data)
summary(final)
sub_2[,1]-final$fitted.values



