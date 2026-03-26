library(MASS)       
library(boot)      
data("Boston")
head(Boston)
mean_medv <- function(data, indices) {
  sample_data <- data[indices]  # bootstrap sample
  return(mean(sample_data))
}
set.seed(123)  
bootstrap_results <- boot(data = Boston$medv, statistic = mean_medv, R = 1000) 
print(bootstrap_results)
boot.ci(bootstrap_results, type = "perc")
