#  --Chunk 16--

library(xtable)

source("src/rscripts/Classification/kNN/kNN.R")
source("src/rscripts/Classification/kNN/kNNExecute.R")


confusion_matrix <- plot_knn_accuracy_and_confusion_matrix(train_data_num,test_data_num)$prediction


rownames(confusion_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
colnames(confusion_matrix) <- c("Estymowane 0", "Estymowane 1")

print(xtable(confusion_matrix, caption = paste0("Macierz pomyłek dla algorytmu kNN, k = ", max_k), label = "tab:kNN"),comment=FALSE)
