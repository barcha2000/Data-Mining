source("src/rscripts/Classification/QDA/QDA.R")

model <- build_qda_model(train_data)
predictions <- make_qda_prediction(model,test_data)