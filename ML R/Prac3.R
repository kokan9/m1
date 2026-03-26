library(ISLR)
library(MASS)
data(Weekly)
set.seed(1)
train <- Weekly$Year < 2009
test <- !train
qda.model <- qda(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5,
                 data = Weekly,
                 subset = train)
qda.pred <- predict(qda.model, Weekly[test, ])
confusion.matrix <- table(Predicted = qda.pred$class,
                          Actual = Weekly$Direction[test])
print(confusion.matrix)
accuracy <- mean(qda.pred$class == Weekly$Direction[test])
print(paste("QDA Classification Accuracy:", round(accuracy, 4)))
lda.model <- lda(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5,
                 data = Weekly,
                 subset = train)
lda.pred <- predict(lda.model, Weekly[test, ])
lda.confusion <- table(Predicted = lda.pred$class,
                       Actual = Weekly$Direction[test])
print(lda.confusion)
lda.accuracy <- mean(lda.pred$class == Weekly$Direction[test])
print(paste("LDA Classification Accuracy:", round(lda.accuracy, 4)))

