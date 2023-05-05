library(xtable)

source("src/rscripts/Classification/DecisionTree/DecisionTreeExecute.R")

print(xtable(confusion_matrix, caption = paste0("Confusion matrix")),comment=FALSE)