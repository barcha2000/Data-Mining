source("src/rscripts/Classification/LogisticRegression/LogisticRegression.R")

train_data_ext <- train_data %>% 
  filter(Contract != "Month-to-month")

test_data_ext <- test_data %>% 
  filter(Contract != "Month-to-month")

train_complement <-  setdiff(train_data, train_data_ext)
test_complement <-  setdiff(test_data, test_data_ext)

length(complement$Churn)
sum(as.integer(complement$Churn) - 1)


length(test_data_ext$Churn)
sum(as.integer(test_data_ext$Churn) - 1)

model <- build_logistic_regression_model(train_complement, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","PaperlessBilling","InternetService","PaymentMethod","MonthlyCharges","TotalCharges", "Churn"))
thresholds <- seq(0, 1, by = 0.01)

#inicjalizujemy wektory na wyniki
accuracies <- rep(0, length(thresholds))

#dokonujemy predykcji dla każdej wartości progu
for (i in seq_along(thresholds)) {
  prediction <- make_logistic_regression_prediction(model, test_complement, threshold = thresholds[i], variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","OnlineSecurity","InternetService","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn"))
  accuracies[i] <- prediction$accuracy
}

#znajdujemy wartość progową dla maksymalnej skuteczności
max_threshold <- thresholds[which.max(accuracies)]


prediction <- make_logistic_regression_prediction(model, test_complement,threshold = 0.54, variables = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","OnlineSecurity","OnlineBackup","DeviceProtection","InternetService","TechSupport","StreamingTV","StreamingMovies","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn"))

model <- build_logistic_regression_model(train_data_ext)
thresholds <- seq(0, 1, by = 0.01)

#inicjalizujemy wektory na wyniki
accuracies <- rep(0, length(thresholds))

#dokonujemy predykcji dla każdej wartości progu
for (i in seq_along(thresholds)) {
  prediction <- make_logistic_regression_prediction(model, test_data_ext, threshold = thresholds[i])
  accuracies[i] <- prediction$accuracy
}

#znajdujemy wartość progową dla maksymalnej skuteczności
max_threshold <- thresholds[which.max(accuracies)]

prediction <- make_logistic_regression_prediction(model, test_data_ext, threshold = 0.49)