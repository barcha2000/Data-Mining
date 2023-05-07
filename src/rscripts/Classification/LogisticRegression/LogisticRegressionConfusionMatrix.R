library(xtable)

source("src/rscripts/Classification/LogisticRegression/LogisticRegression.R")
source("src/rscripts/Classification/LogisticRegression/LogisticRegressionExecute.R")

confusion_matrix <- make_logistic_regression_prediction(logistic_regression_model, test_data, threshold = max_threshold)$confusion_matrix

rownames(confusion_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
colnames(confusion_matrix) <- c("Estymowane 0", "Estymowane 1")


print(xtable(confusion_matrix, caption = paste0("Macierz pomyłek dla regresji logistycznej, z punktem odcięcia = ", max_threshold), label = "tab:LogisticRegression"),comment=FALSE)
