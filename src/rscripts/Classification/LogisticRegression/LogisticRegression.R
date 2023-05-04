logistic_regression_model <- glm(Churn ~ ., data = train_data, family = binomial(link = "logit"))

# Predykcja na zbiorze testowym
logistic_regression_prediction <- ifelse(predict(logistic_regression_model, newdata = test_data, type = "response") > 0.5, 1, 0)

# Obliczenie skuteczności predykcji
accuracy <- sum(logistic_regression_prediction == test_data$Churn) / nrow(test_data)
