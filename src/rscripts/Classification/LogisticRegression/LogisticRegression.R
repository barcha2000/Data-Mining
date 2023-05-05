library(dplyr)
library(ggplot2)

build_logistic_regression_model <- function(train_data, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn")) {
  df_subset <- train_data %>% dplyr::select(variables)
  formula <- as.formula(paste("Churn ~ ", paste(variables[-length(variables)], collapse = "+")))
  model <- glm(formula, data = df_subset, family = binomial)
  return(model)
}

make_logistic_regression_prediction <- function(model, test_data, threshold = 0.5, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges")) {
  df_subset_test <- test_data %>% dplyr::select(variables, "Churn")
  predictions <- predict(model, newdata = df_subset_test, type = "response")
  classified <- ifelse(predictions > threshold, 1, 0)
  confusion_matrix <- table(classified, df_subset_test$Churn)
  accuracy <- sum(diag(confusion_matrix))/nrow(df_subset_test)
  return(list(classified = classified, accuracy = accuracy, confusion_matrix = confusion_matrix))
}

plot_threshold_accuracy <- function(model,test_data) {
  # tworzymy sekwencję progów od 1 do 2 z krokiem 0.01
  thresholds <- seq(0, 1, by = 0.01)
  
  # inicjalizujemy wektory na wyniki
  accuracies <- rep(0, length(thresholds))
  
  # dokonujemy predykcji dla każdej wartości progu
  for (i in seq_along(thresholds)) {
    prediction <- make_logistic_regression_prediction(model, test_data, threshold = thresholds[i], variables = colnames(test_data))
    accuracies[i] <- prediction$accuracy
  }
  
  # znajdujemy wartość progową dla maksymalnej skuteczności
  max_threshold <- thresholds[which.max(accuracies)]
  
  # tworzymy wykres skuteczności względem wartości progowej
  df <- data.frame(threshold = thresholds, accuracy = accuracies)
  
  plot <- ggplot(df, aes(x = threshold, y = accuracy)) +
    geom_line() +
    geom_vline(xintercept = max_threshold, linetype = "dashed") +
    geom_text(aes(x = max_threshold, y = max(accuracies), label = paste0("Max accuracy\nThreshold = ", max_threshold)), 
              hjust = 1.5, vjust = 0.5) +
    xlab("Threshold") +
    ylab("Accuracy") +
    ggtitle("Accuracy vs. Threshold")
  
  return(plot)
}

plot_regression_coefficients <- function(model) {
  coefficients <- coef(model)
  variable_names <- names(coefficients)[-1]
  coefficients_df <- data.frame(variable = variable_names, coefficient = coefficients[-1])
  
  ggplot(coefficients_df, aes(x = variable, y = coefficient)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    ggtitle("Regression coefficients") +
    xlab("Variable") +
    ylab("Coefficient") +
    theme(plot.title = element_text(hjust = 0.5),
          axis.text.x = element_text(angle = 90, hjust = 1))
}
