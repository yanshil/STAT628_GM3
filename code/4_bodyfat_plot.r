library(tidyverse)
library(ggplot2)
data<-read.csv("BodyFat.csv")
summary(data)
par(mfrow=c(1,2))


#plot(data[,i],main=colnames(data[i]))
#AGE
data %>% ggplot +
geom_point(mapping = aes(x = seq_along(data[,4]), y = data[,4],
                         color = seq_along(data[,4]) >78 & seq_along(data[,4]) < 80,
                         size = seq_along(data[,4]) >78 & seq_along(data[,4]) < 80 ))+
  scale_colour_manual(values = c("blue", "red")) +
  scale_size_manual(values =c(1, 4))+
  labs(x = "Index",y = colnames(data)[4])+
  theme(legend.position = "none")+
  ggtitle("scatter plot of age")


#BODYFAT
data %>% ggplot +
  geom_point(mapping = aes(x = seq_along(data[,2]), y = data[,2],
                           color = seq_along(data[,2]) >181 & seq_along(data[,2]) < 183 |
                             seq_along(data[,2]) < 217 & seq_along(data[,2]) >215,
                           size = seq_along(data[,2]) >181 & seq_along(data[,2]) < 183 ))+
  scale_colour_manual(values = c("blue", "red")) +
  scale_size_manual(values =c(1, 4))+
  labs(x = "Index",y = colnames(data)[2])+
  theme(legend.position = "none")+
    ggtitle("scatter plot of bodyfat")

#WEIGHT
data %>% ggplot +
  geom_point(mapping = aes(x = seq_along(data[,5]), y = data[,5],
                           color = seq_along(data[,5]) >38 & seq_along(data[,5]) < 40,
                           size = seq_along(data[,5]) > 38 & seq_along(data[,5]) < 40 ))+
  scale_colour_manual(values = c("blue", "red")) +
  scale_size_manual(values =c(1, 4))+
  labs(x = "Index",y = colnames(data)[5])+
  theme(legend.position = "none")+
    ggtitle("scatter plot of weight")


#HEIGHT
data %>% ggplot +
  geom_point(mapping = aes(x = seq_along(data[,6]), y = data[,6],
                           color = seq_along(data[,6]) >41 & seq_along(data[,6]) < 43,
                           size = seq_along(data[,6]) >41 & seq_along(data[,6]) < 43 ))+
  scale_colour_manual(values = c("blue", "red")) +
  scale_size_manual(values =c(1, 4))+
  labs(x = "Index",y = colnames(data)[6])+
  theme(legend.position = "none")+
    ggtitle("scatter plot of height")

par(mfrow=c(4,4))
for( i in 2:17){
    hist(data[,i],prob=FALSE,main=colnames(data[i]),col="lightblue")
}


par(mfrow=c(4,4))
for( i in 2:17){
  hist(data[,i],prob=TRUE,main=colnames(data[i]),col="lightblue")
  lines(density(data[,i]), col="red", lwd=2) # add a density estimate with defaults
}
