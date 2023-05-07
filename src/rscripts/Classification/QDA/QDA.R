library(dplyr)
library(MASS)

# model QDA
build_qda_model <- function(train_data, variables = c("tenure","MonthlyCharges","TotalCharges", "Churn")) {
  df_subset <- train_data %>% dplyr::select(variables)
  model <- MASS::qda(Churn ~ ., data = df_subset)
  return(model)
}

# predykcja dla modelu QDA
make_qda_prediction <- function(model, test_data, variables = c("tenure","MonthlyCharges","TotalCharges", "Churn")) {
  df_subset_test <- test_data %>% dplyr::select(variables, "Churn")
  predictions <- predict(model, newdata = df_subset_test)
  classified <- as.numeric(predictions$class)
  confusion_matrix <- table(classified, df_subset_test$Churn)
  accuracy <- sum(diag(confusion_matrix))/nrow(df_subset_test)
  return(list(classified = classified, accuracy = accuracy, confusion_matrix = confusion_matrix))
}
