library(randomForest)
library(randomForestExplainer)
library(ggplot2)

n_trees <- seq(1, 50, 1)

# utworzenie pustej listy, do której będą dodawane wyniki dokładności predykcji dla każdej ilości drzew
accuracy <- vector("list", length(n_trees))

# budowanie modeli dla kolejnych ilości drzew
for (i in seq_along(n_trees)) {
  model <- randomForest(Churn ~ ., data = train_data, ntree = n_trees[i], importance = TRUE)
  predicted <- predict(model, test_data)
  accuracy[[i]] <- mean(predicted == test_data$Churn)
}
# połączenie wyników dokładności predykcji i ilości drzew w ramach jednej tabeli
results <- data.frame(ntrees = n_trees, accuracy = unlist(accuracy))
# narysowanie wykresu (już w pliku RMD)

max_acc_index <- which.max(accuracy)
max_acc_trees <- n_trees[max_acc_index]

library(caret)

# train the model with the optimal number of trees
model <- randomForest(Churn ~ ., data = train_data, ntree = max_acc_trees, importance = TRUE)

# make predictions on the test data
predicted <- predict(model, test_data)

# create the confusion matrix
confusion_matrix <- confusionMatrix(predicted, test_data$Churn)
a<-as.table(confusion_matrix)

rownames(a) <- c("Rzeczwiste 0", "Rzeczwiste 1")
colnames(a) <- c("Estymowane 0", "Estymowane 1")