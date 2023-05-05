#  --Chunk 8--

source("src/rscripts/Classification/LinearRegression/LinearRegressionExecute.R")
source("src/rscripts/Classification/LinearRegression/LinearRegression.R")

plot_threshold_accuracy(linear_regression_model, test_data)
