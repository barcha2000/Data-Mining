library(ipred)
library(rpart)



# Set the seed for reproducibility
set.seed(123)

train1<-train_data_num
train1$Churn<-model.matrix(~train1$Churn)[, -1]

test1<-test_data_num
test1$Churn<-model.matrix(~test1$Churn)[, -1]

# Build the bagging model
model_bagging <- bagging(Churn ~ ., data = train1, nbagg = 25, coob = TRUE, control = rpart.control(maxdepth = 3))

# Make predictions on the test data
predicted <- predict(model_bagging, newdata = test1, type = "class")
actual <- test1$Churn

predicted
actual

# Compute the accuracy of the model
accuracy <- mean((as.numeric(predicted > 0.5)) == as.numeric(actual))
cat("Accuracy:", accuracy, "\n")


confusion_matrix <- confusionMatrix(as.factor(as.numeric(predicted > 0.5)), test_data_num$Churn)
conf<-xtable(confusion_matrix$table)

print(conf, comment=F)
