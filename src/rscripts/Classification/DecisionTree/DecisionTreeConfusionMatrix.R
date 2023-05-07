library(xtable)

source("src/rscripts/Classification/DecisionTree/DecisionTreeExecute.R")

rownames(confusion_matrix) <- c("Rzeczwiste 0", "Rzeczwiste 1")
colnames(confusion_matrix) <- c("Estymowane 0", "Estymowane 1")


print(xtable(confusion_matrix, caption = paste0("Macierz pomyłek dla drzewa decyzyjnego"), label = "tab:DecisionTree"),comment=FALSE)