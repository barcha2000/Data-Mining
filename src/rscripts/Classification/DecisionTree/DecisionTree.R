library(dplyr)
library(rpart)
library(rpart.plot)

#Budujemy model drzewa decyzyjnego
build_decision_tree_model <- function(train_data, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn")) {
  df_subset <- train_data %>% dplyr::select(variables)
  formula <- as.formula(paste("Churn ~ ", paste(variables[-length(variables)], collapse = "+")))
  model <- rpart(formula, data = df_subset, method = "class")
  return(model)
}

#Tworzymy predykcje
make_decision_tree_prediction <- function(model, test_data, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges")) {
  df_subset_test <- test_data %>% dplyr::select(variables, "Churn")
  predictions <- predict(model, newdata = df_subset_test, type = "class")
  return(predictions)
}

#Tworzymy macierz pomyłek
generate_confusion_matrix <- function(actual, predicted) {
  conf_matrix <- table(actual, predicted)
  return(conf_matrix)
}

#Tworzymy wykres drzewa decyzyjnego
plot_decision_boundary <- function(model){
  return(rpart.plot(model))
}


