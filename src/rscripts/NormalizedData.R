#  --Chunk 0--
library(dplyr)
library(caret)
set.seed(123)

#Normalizujemy dane
normalized_data <- WA_Fn_UseC_Telco_Customer_Churn %>%
  select(-customerID) %>%
  mutate_if(is.numeric, scale)

#Tworzymy zbiory treningowe i testowe
train_indices <- createDataPartition(normalized_data$Churn, p = 0.8, list = FALSE)
train_data <- normalized_data[train_indices, ] 
test_data <- normalized_data[-train_indices, ] 