#  --Chunk 9--

library(xtable)

source("src/rscripts/Classification/LinearRegression/LinearRegression.R")
source("src/rscripts/Classification/LinearRegression/LinearRegressionExecute.R")

print(xtable(make_linear_regression_prediction(model, test_data, threshold = max_threshold)$confusion_matrix, caption = paste0("Confusion matrix at threshold = ", max_threshold)),comment=FALSE)
