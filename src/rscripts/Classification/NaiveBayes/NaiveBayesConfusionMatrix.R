#  --Chunk 14--

library(xtable)

source("src/rscripts/Classification/NaiveBayes/NaiveBayesExecute.R")


rownames(confusion_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
colnames(confusion_matrix) <- c("Estymowane 0", "Estymowane 1")


print(xtable(confusion_matrix, caption = paste0("Macierz pomyłek dla algorytmu Naiwnego Bayesa"), label = "tab:NaiveBayes"),comment=FALSE)