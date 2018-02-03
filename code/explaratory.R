#######################
## Explaratory Analysis

d <- read.csv("./data/BodyFat.csv")
str(d)
summary(d)

######################
which(d$BODYFAT == 0)
#182
d$IDNO[182]
which(d$BODYFAT == 45.1)
#216
d$IDNO[216]

# https://www.cdc.gov/mmwr/preview/mmwrhtml/mm5751a4.htm

#Percentage of Body Fat (i.e. 100*B) = 495/D - 450.  
495 / d$DENSITY[182] - 450

495 / d$DENSITY[216] - 450

d <- d[-182,]

## Just Explain the min adn max rather than the table

## Can explain Density Variance

fit <- lm(BODYFAT ~ .-IDNO-DENSITY, data=d)
summary(fit)

plot(fit)

## Data Cleaning
n <- dim(d)[1]
p <- dim(d)[2]- 3

### Outlier
plot(fit, which=4) ## Cook's distance

d[42,] # Height = 29.5 in = 74.93 cm;   92.98 kg
d[39,] # Weight = 363.15 lbs = 164.72 kg (May make sense)
d[39,] # Weight = 363.15 lbs = 164.72 kg (May make sense)
# IDNO BODYFAT DENSITY AGE WEIGHT HEIGHT ADIPOSITY NECK CHEST ABDOMEN   HIP THIGH KNEE ANKLE BICEPS FOREARM
# 39   39    33.8  1.0202  46 363.15  72.25      48.9 51.2 136.2   148.1 147.7  87.3 49.1  29.6     45      29
# WRIST
# 39  21.4
d[86,] # 

# Check BMI
d$WEIGHT/d$HEIGHT^2*703
BMI <-  d$WEIGHT * 0.453592 / (d$HEIGHT*2.54*0.01)^2
plot(BMI)
abline(v = 42, lty = 2)

d$ADIPOSITY
plot(d$ADIPOSITY)

summary(d)

d <- d[-42,]


d <- d[-39,]

## Prior?
## Wrist and Knee are not good measurement ?

# Check Influential point (By histogram)
## Age = 80
## Weight > 350
## Knee > 48
