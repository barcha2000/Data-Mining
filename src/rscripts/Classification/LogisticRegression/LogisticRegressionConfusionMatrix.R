library(xtable)

source("src/rscripts/Classification/LogisticRegression/LogisticRegression.R")
source("src/rscripts/Classification/LogisticRegression/LogisticRegressionExecute.R")

print(xtable(make_logistic_regression_prediction(logistic_regression_model, test_data, threshold = max_threshold)$confusion_matrix, caption = paste0("Confusion matrix at threshold = ", max_threshold)),comment=FALSE)
