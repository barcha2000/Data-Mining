#  --Chunk 9--

library(xtable)

source("src/rscripts/Classification/LinearRegression/LinearRegression.R")
source("src/rscripts/Classification/LinearRegression/LinearRegressionExecute.R")

conf_matrix <- make_linear_regression_prediction(linear_regression_model, test_data, threshold = max_threshold)$confusion_matrix
rownames(conf_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
colnames(conf_matrix) <- c("Estymowane 0", "Estymowane 1")


print(xtable(conf_matrix, caption = paste0("Macierz pomyłek dla regresji liniowej, z punktem odcięcia = ", max_threshold), label = "tab:LinearRegression"),comment=FALSE)
