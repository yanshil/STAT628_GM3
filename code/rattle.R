library(caret)
library(rattle)


d <- read.csv("./data/BodyFat.csv")


train_control <- trainControl(method="cv", number=10, savePredictions = TRUE)
model<- train(BODYFAT ~ .-IDNO-DENSITY, data=d, trControl=train_control, 
              method="rpart", na.action = na.rpart)


fancyRpartPlot(model$finalModel)
