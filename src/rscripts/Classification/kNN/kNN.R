library(dplyr)
library(ggplot2)
library(class)

build_knn_model <- function(train_data, test_data, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn"), k = 5) {
  df_subset_train <- train_data %>% dplyr::select(variables)
  df_subset_test <- test_data %>% dplyr::select(variables)
  df_subset_train$Churn <- factor(df_subset_train$Churn)
  model <- knn(train = df_subset_train[,-length(variables)], test = df_subset_test[,-length(variables)], cl = as.vector(unlist(train_data[,length(variables)])), k = k)
  return(model)
}

make_knn_prediction <- function(model, test_data) {
  confusion_matrix <- as.matrix(table(Actual = test_data_num$Churn, Predicted = model))
  accuracy <- sum(diag(confusion_matrix))/nrow(test_data)
  return(list(classified = model, accuracy = accuracy, confusion_matrix = confusion_matrix))
}

plot_knn_accuracy_and_confusion_matrix <- function(train_data,test_data) {
  # tworzymy sekwencję wartości k od 1 do 50
  k_values <- seq(1, 100, by = 1)
  
  # inicjalizujemy wektory na wyniki
  accuracies <- rep(0, length(k_values))
  
  best_prediction_acc <- 0

  
  # dokonujemy predykcji dla każdej wartości k
  for (i in seq_along(k_values)) {
    model <- build_knn_model(train_data, test_data, k = k_values[i], variables = colnames(test_data))
    prediction <- make_knn_prediction(model,test_data_num)
    accuracies[i] <- prediction$accuracy
    if (accuracies[i] > best_prediction_acc){
      best_prediction_acc <- accuracies[i]
      best_prediction <- prediction
    }
  }
  
  # znajdujemy wartość k dla maksymalnej skuteczności
  max_k <- k_values[which.max(accuracies)]
  
  # tworzymy wykres skuteczności względem wartości k
  df <- data.frame(k = k_values, accuracy = accuracies)
  
  plot <- ggplot(df, aes(x = k, y = accuracy)) +
    geom_line() +
    geom_vline(xintercept = max_k, linetype = "dashed") +
    geom_text(aes(x = max_k, y = max(accuracies), label = paste0("Max accuracy\nk = ", max_k)), 
              hjust = 1.5, vjust = 0.5) +
    xlab("k") +
    ylab("Accuracy") +
    ggtitle("Accuracy vs. k")
  
  return(list("plot" = plot, "prediction" = best_prediction$confusion_matrix))
}
