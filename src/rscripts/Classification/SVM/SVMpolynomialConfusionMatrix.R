#  --Chunk 20--

library(xtable)

source("src/rscripts/Classification/SVM/SVMpolynomial.R")


colnames(confusion_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
rownames(confusion_matrix) <- c("Estymowane 0", "Estymowane 1")


print(xtable(confusion_matrix, caption = paste0("Macierz pomyłek dla SVM (jądro wielomianowe)"), label = "tab:SVMpolynomial"),comment=FALSE)
