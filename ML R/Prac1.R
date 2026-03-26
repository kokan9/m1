library (MASS)
library(ggplot2)
data("Boston")
model <- lm(medv ~ lstat, data = Boston)
summary (model)
ggplot (Boston, aes(lstat, medv)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Linear Regression: medv vs lstat",
    x = "LSTAT (%)",
    y= "MEDV (House Price)"
  )
