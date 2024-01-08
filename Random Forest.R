library(tidyverse)
library(readxl)
Red_wine <- read_excel("D:/Audrey Desktop/Eddie-Importante/Machine Learning/RandomForest/Red_wine.xlsx")
View(Red_wine)

# Random forest for both classification and Regression methods

install.packages("randomForest")
library(randomForest)
head(Red_wine)

# Converting the quality variable into a factor for downstream analysis

Red_wine$quality<-as.factor(Red_wine$quality)

# Creating the training and the Test datasets

data_Size <- floor(nrow(Red_wine)*0.80)

index<-sample(1:nrow(Red_wine), size = data_Size)

# Creating the training dataset

training <-Red_wine[index, ]

testing <-Red_wine[-index, ]

# Generating the random forest

rf<-randomForest(quality~.,data = training, mtry=4, ntree=2001, importance=T)

# View the generated random forest
rf

# Plotting our random forest outcome

plot(rf)

png(file = "randomforest.png")
plot(rf)
dev.off()

# Predicting the outcome

result <-data.frame(testing$quality, predict(rf, testing[,1:11], type = "response"))
head(result, 10)

# Plotting the result

plot(result)

png(filename = "result.png")
plot(result)
dev.off()