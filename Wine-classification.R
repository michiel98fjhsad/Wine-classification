set.seed(42)
library(caret)
library(rpart)
library(randomForest)
data <- read.csv("C:/Users/michi/Downloads/wine.data")
names <- cbind("Class", "Alcohol", "Malic acid",
               "Ash",
               "Alcalinity of ash",  
               "Magnesium",
               "Total phenols",
               "Flavanoids", 
               "Nonflavanoid phenols", 
               "Proanthocyanins", 
               "Color intensity", 
               "Hue", 
               "OD280/OD315 of diluted wines", 
               "Proline")
colnames(data) <- names
wine.data <- data.frame(data)
lm(Class ~ ., data = wine.data) 
ggplot(wine.data, aes(x=Alcohol)) + geom_histogram()

wine.data$Class <- as.factor(wine.data$Class)
rf.model <- randomForest(Class~., data = wine.data,
                         importance = TRUE, proximity= TRUE)
print(rf.model)