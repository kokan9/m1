install.packages("ISLR")
install.packages("class")
install.packages("caret")
library(ISLR)
library(class)
library(caret)
data(Weekly)
Weekly$Direction <- as.factor(ifelse(Weekly$Direction == "Up", 1, 0))
X <- Weekly[, c("Lag1", "Lag2", "Lag3", "Lag4", "Lag5", "Volume")]
Y <- Weekly$Direction
set.seed(123)
trainIndex <- createDataPartition(Y, p = 0.7, list = FALSE)
X_train <- X[trainIndex, ]
X_test <- X[-trainIndex, ]
Y_train <- Y[trainIndex]
Y_test <- Y[-trainIndex]
preProc <- preProcess(X_train, method = c("center", "scale"))
X_train <- predict(preProc, X_train)X_test <- predict(preProc, X_test)

k <- 5
knn_pred <- knn(train = X_train,
                test = X_test,
                cl = Y_train,
                k = k)
conf_mat <- confusionMatrix(knn_pred, Y_test)
accuracy <- mean(knn_pred == Y_test)
print(conf_mat)
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))
