library(xtable)

source("src/rscripts/Classification/NaiveBayes/NaiveBayesExecute.R")

print(xtable(confusion_matrix, caption = paste0("Confusion matrix"), label = "tab:NaiveBayes"),comment=FALSE)