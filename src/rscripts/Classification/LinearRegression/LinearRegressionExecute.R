#  --Chunk 8--

source("src/rscripts/Classification/LinearRegression/LinearRegression.R")

linear_regression_model <- build_linear_regression_model(train_data)
linear_regression_prediction <- make_linear_regression_prediction(linear_regression_model, test_data, threshold = 1.)

# tworzymy sekwencję progów od 1 do 2 z krokiem 0.01
thresholds <- seq(1, 2, by = 0.01)

# inicjalizujemy wektory na wyniki
accuracies <- rep(0, length(thresholds))

# dokonujemy predykcji dla każdej wartości progu
for (i in seq_along(thresholds)) {
  prediction <- make_linear_regression_prediction(linear_regression_model, test_data, threshold = thresholds[i])
  accuracies[i] <- prediction$accuracy
}

# znajdujemy wartość progową dla maksymalnej skuteczności
max_threshold <- thresholds[which.max(accuracies)]
