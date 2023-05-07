library(xtable)

source("src/rscripts/Classification/kNN/kNN.R")
source("src/rscripts/Classification/kNN/kNNExecute.R")

confusion_matrix <- plot_knn_accuracy_and_confusion_matrix(train_data_num,test_data_num)$prediction
print(xtable(confusion_matrix, caption = paste0("Confusion matrix for k = ", max_k), label = "tab:kNN"),comment=FALSE)
