library(gmodels)

source("src/rscripts/Classification/kNN/kNN.R")

knn_regression_model <- build_knn_model(train_data_num, test_data_num, k = 42)


confusion_matrix = as.matrix(table(Actual = test_data_num$Churn, Predicted = knn_regression_model))


#tworzymy sekwencję progów od 0 do 1 z krokiem 0.01
k_values <- seq(1, 50, by = 1)

#inicjalizujemy wektory na wyniki
accuracies <- rep(0, length(k_values))

#dokonujemy predykcji dla każdej wartości progu
for (i in seq_along(k_values)) {
  model <- build_knn_model(train_data_num, test_data_num, k = k_values[i], variables = colnames(test_data))
  prediction <- make_knn_prediction(model,test_data_num)
  accuracies[i] <- prediction$accuracy
}

#znajdujemy wartość progową dla maksymalnej skuteczności
max_k <- k_values[which.max(accuracies)]

execute <- plot_knn_accuracy_and_confusion_matrix(train_data_num, test_data_num)