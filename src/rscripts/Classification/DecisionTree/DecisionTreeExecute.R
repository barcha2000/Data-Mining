source("src/rscripts/Classification/DecisionTree/DecisionTree.R")

model <- build_decision_tree_model(train_data_num)
prediction <- make_decision_tree_prediction(model, test_data_num)

confusion_matrix <- generate_confusion_matrix(test_data_num$Churn,prediction)

decision_boundary <- plot_decision_boundary(model)

