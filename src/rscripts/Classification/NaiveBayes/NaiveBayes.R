library(klaR)
library(dplyr)

#Budujemy model naiwnego bayesa
build_mixed_naive_bayes_model <- function(train_data, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn")) {
  df_subset <- train_data %>% dplyr::select(variables)
  formula <- as.formula(paste("Churn ~ ", paste(variables[-length(variables)], collapse = "+")))
  model <- NaiveBayes(formula, data = df_subset)
  return(model)
}

#Tworzymy predykcje
make_mixed_naive_bayes_prediction <- function(model, test_data, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges")) {
  df_subset_test <- test_data %>% dplyr::select(variables, "Churn")
  predictions <- predict(model, newdata = df_subset_test)
  return(predictions$class)
}

#Tworzymy macierz pomyłek
generate_confusion_matrix <- function(actual, predicted) {
  conf_matrix <- table(actual, predicted)
  return(conf_matrix)
}
