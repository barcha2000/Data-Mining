library(xtable)

source("src/rscripts/Classification/NaiveBayes/NaiveBayesExecute.R")

print(xtable(confusion_matrix, caption = paste0("Confusion matrix")),comment=FALSE)