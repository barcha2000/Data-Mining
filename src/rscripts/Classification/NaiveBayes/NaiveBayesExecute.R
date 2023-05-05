source("src/rscripts/Classification/NaiveBayes/NaiveBayes.R")

model <- build_mixed_naive_bayes_model(train_data_num)
prediction <- make_mixed_naive_bayes_prediction(model, test_data_num)

confusion_matrix <- generate_confusion_matrix(test_data_num$Churn,prediction)