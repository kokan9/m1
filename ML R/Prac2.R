library(MASS)
data(Boston)
str(Boston)

model <- lm(medv ~ lstat + rm, data = Boston)
summary(model)

predicted_medv <- predict(model, Boston)
plot(Boston$medv, predicted_medv,
     xlab = "Actual Median House Value (MEDV)",
     ylab = "Predicted Median House Value",
     main = "Least Squares Regression Fit",
     pch = 19,
     col = "blue")

abline(0, 1, col = "red", lwd = 2)

par(mfrow = c(2, 2))
plot(model)

