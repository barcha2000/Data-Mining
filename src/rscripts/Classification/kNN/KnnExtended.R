source("src/rscripts/Classification/kNN/kNN.R")

train_data_ext <- train_data %>% 
  filter(Contract != "Month-to-month" | InternetService == "No" | Dependents == "Yes" | PaymentMethod != "Electronic check")

test_data_ext <- test_data %>% 
  filter(Contract != "Month-to-month" | InternetService == "No" | Dependents == "Yes" | PaymentMethod != "Electronic check")

train_complement <-  setdiff(train_data, train_data_ext)
test_complement <-  setdiff(test_data, test_data_ext)


model <- build_knn_model(train_complement,test_complement, variables = c("gender","SeniorCitizen","Partner","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","PaperlessBilling","MonthlyCharges","TotalCharges", "Churn"))
prediction <- make_knn_prediction(model, test_complement, variables = c("gender","SeniorCitizen","Partner","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","PaperlessBilling","MonthlyCharges","TotalCharges", "Churn"))

model <- build_knn_model(train_data_ext,  variables = c("gender","SeniorCitizen","Partner","tenure","PhoneService","MultipleLines","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn"))
prediction <- make_knn_prediction(model, test_data_ext,  variables = c("gender","SeniorCitizen","Partner","tenure","PhoneService","MultipleLines","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges", "Churn"))