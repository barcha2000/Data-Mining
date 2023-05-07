library(e1071)
library(xtable)

svm_model <- svm(Churn ~ ., data = train_data_num, kernel = "polynomial", cost = 1, quiet = T, verbose = F)

# predykcja na danych testowych
predictions <- predict(svm_model, newdata = test_data_num, verbose = F)

# wyświetlenie macierzy pomyłek i obliczenie dokładności
confusion_matrix <- table(predictions, test_data_num$Churn)
accuracy <- sum(diag(confusion_matrix))/nrow(test_data_num)
