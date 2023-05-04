QDA_model <- build_qda_model(train_data)
QDA_prediction <- make_qda_prediction(QDA_model,test_data)