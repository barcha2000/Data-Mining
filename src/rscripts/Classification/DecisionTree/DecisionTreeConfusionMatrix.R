library(xtable)

source("src/rscripts/Classification/DecisionTree/DecisionTreeExecute.R")

print(xtable(confusion_matrix, caption = paste0("Confusion matrix"), label = "tab:DecisionTree"),comment=FALSE)