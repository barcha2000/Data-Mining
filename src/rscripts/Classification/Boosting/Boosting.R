#  --Chunk 24--

library(xgboost)
library(ggplot2)
library(DALEX)
library(DALEXtra)

set.seed(123243)

binary_var <- model.matrix(~train_data_num$Churn)[, -1]
binary_var1 <- model.matrix(~test_data_num$Churn)[, -1]

label <- na.omit(binary_var)
train <- train_data_num[, !names(train_data_num) %in% "Churn"]
test_label <- na.omit(binary_var1)
test <- test_data_num[, !names(test_data_num) %in% "Churn"]

dtrain <- xgb.DMatrix(data = as.matrix(train), label = label)
dtest <- xgb.DMatrix(data = as.matrix(test), label = test_label)

params <- list(
  objective = "binary:logistic",
  eta = 0.1,
  max_depth = 6,
  subsample = 0.8,
  colsample_bytree = 0.8
)

bst <- xgb.train(params, dtrain, nrounds = 100)
pred <- predict(bst, dtest)

library(pROC)
accuracy <- mean((as.numeric(pred > 0.5)) == as.numeric(test_label))
auc <- auc(roc(test_label, pred))


library(caret)
confusion_matrix <- confusionMatrix(as.factor(as.numeric(pred > 0.5)), test_data_num$Churn)$table
colnames(confusion_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
rownames(confusion_matrix) <- c("Estymowane 0", "Estymowane 1")
x<-xtable(confusion_matrix, caption = "Macierz pomyłek dla boostingu")
print(xtable(x, caption = "Macierz pomyłek dla boostingu"),comment = F)

