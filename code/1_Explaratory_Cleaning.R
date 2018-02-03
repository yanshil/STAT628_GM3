#######################
## Explaratory Analysis
setwd("/home/cc886/OneDrive/RstudioWorkspace/STAT628_GM3")
d <- read.csv("./data/BodyFat.csv")
str(d)
summary(d)

## Go into details
which(d$BODYFAT == 0)
#182
d$IDNO[182]
which(d$BODYFAT == 45.1)
#216
d$IDNO[216]

## Check if density can be used as another y for these two abnormal obsercations
# Siri: Percentage of Body Fat (i.e. 100*B) = 495/D - 450.  
495 / d$DENSITY[182] - 450

495 / d$DENSITY[216] - 450

# 182 not valid
d <- d[-182,]

fit <- lm(BODYFAT ~ .-IDNO-DENSITY, data=d)
summary(fit)
par(mfrow = c(2,2))
plot(fit)   # 1_diag182.png
##########################################
## Data Cleaning
n <- dim(d)[1]
p <- dim(d)[2]- 3

### Outlier
par(mfrow = c(1,1))
plot(fit, which=4) ## Cook's distance

d[42,] # Height = 29.5 in = 74.93 cm;   92.98 kg
d[39,] # Weight = 363.15 lbs = 164.72 kg (May make sense)
# IDNO BODYFAT DENSITY AGE WEIGHT HEIGHT ADIPOSITY NECK CHEST ABDOMEN   HIP THIGH KNEE ANKLE BICEPS FOREARM
# 39   39    33.8  1.0202  46 363.15  72.25      48.9 51.2 136.2   148.1 147.7  87.3 49.1  29.6     45      29
# WRIST
# 39  21.4
d[86,] # Good

# Check BMI
d$WEIGHT/d$HEIGHT^2*703
BMI <-  d$WEIGHT * 0.453592 / (d$HEIGHT*2.54*0.01)^2
plot(BMI)
abline(v = 42, lty = 2)
####################################
## Check #42
# 1_diag_check42.png
par(mfrow=c(1,2));
plot(fit, which=4) ## Cook's distance
plot(BMI); abline(v = 42, lty = 2); text(42,150,labels = "42",cex = 0.8)
#################################
## Try lm
BodyFat <- read.csv("./data/BodyFat.csv")
## Delete abnormal point
d1 <- BodyFat[-c(182,42),]
## Delete Influential Point
d2 <- BodyFat[-c(182,42,39),]
d3 <- BodyFat[-c(182,42,79),]

fit1 <- lm(BODYFAT~.-IDNO-DENSITY,data = d1)
summary(fit1)

par(mfrow=c(2,2))
plot(fit1) # 1_diag182_42.png


fit2 <- lm(BODYFAT~.-IDNO-DENSITY,data = d2)
plot(fit2)  # 1_diag182_42_39.png
# ID39 is an leverage point

fit3 <- lm(BODYFAT~.-IDNO-DENSITY,data = d3)
plot(fit3) #  # 1_diag182_42_79.png
# 79 looks good

