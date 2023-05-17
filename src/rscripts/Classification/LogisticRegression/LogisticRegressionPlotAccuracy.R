#  --Chunk 11--

source("src/rscripts/Classification/LogisticRegression/LogisticRegressionExecute.R")
source("src/rscripts/Classification/LogisticRegression/LogisticRegression.R")

plot_threshold_accuracy(logistic_regression_model, test_data)