#  --Chunk 11--

source("src/rscripts/Classification/LogisticRegression/LogisticRegression.R")

logistic_regression_model <- build_logistic_regression_model(train_data)
logistic_regression_prediction <- make_logistic_regression_prediction(logistic_regression_model, test_data, threshold = 0.5)

#tworzymy sekwencję progów od 0 do 1 z krokiem 0.01
thresholds <- seq(0, 1, by = 0.01)

#inicjalizujemy wektory na wyniki
accuracies <- rep(0, length(thresholds))

#dokonujemy predykcji dla każdej wartości progu
for (i in seq_along(thresholds)) {
  prediction <- make_logistic_regression_prediction(logistic_regression_model, test_data, threshold = thresholds[i])
  accuracies[i] <- prediction$accuracy
}

#znajdujemy wartość progową dla maksymalnej skuteczności
max_threshold <- thresholds[which.max(accuracies)]