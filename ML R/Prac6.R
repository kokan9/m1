library(MASS)
library(pls)
set.seed(1)
data(Boston)
n <- nrow(Boston)
train <- sample(1:n, n/2)
train_data <- Boston[train, ]
test_data  <- Boston[-train, ]
pcr_fit <- pcr(medv ~ ., data = train_data, scale = TRUE, validation = "CV")
pcr_msep <- RMSEP(pcr_fit)
opt_pcr_comp <- which.min(pcr_msep$val[1, , ]) - 1
pcr_pred <- predict(pcr_fit, test_data, ncomp = opt_pcr_comp)
pcr_test_mse <- mean((pcr_pred - test_data$medv)^2)
pls_fit <- plsr(medv ~ ., data = train_data, scale = TRUE, validation = "CV")
pls_msep <- RMSEP(pls_fit)
opt_pls_comp <- which.min(pls_msep$val[1, , ]) - 1
pls_pred <- predict(pls_fit, test_data, ncomp = opt_pls_comp)
pls_test_mse <- mean((pls_pred - test_data$medv)^2)
cat("PCR Test MSE :", pcr_test_mse, "\n")
cat("PLS Test MSE :", pls_test_mse, "\n")
