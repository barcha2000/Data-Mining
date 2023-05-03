#  --Chunk 0--
library(readr)
library(dplyr)

#Importujemy dane
WA_Fn_UseC_Telco_Customer_Churn <- read_csv("data/WA_Fn-UseC_-Telco-Customer-Churn.csv")

#Sprawdzamy kompletność danych
which(is.na(WA_Fn_UseC_Telco_Customer_Churn), arr.ind=TRUE)

#Dane brakujące są tylko w kolumnie TotalCharge i jest ich tylko 11 (przy 7033 obserwacjach), więc wyrzucamy te obserwacje
WA_Fn_UseC_Telco_Customer_Churn <- na.omit(WA_Fn_UseC_Telco_Customer_Churn)

#Kolumna SeniorCitizen jest 0-1 więc robimy tak aby była kategoryczna
WA_Fn_UseC_Telco_Customer_Churn <- WA_Fn_UseC_Telco_Customer_Churn %>% 
  mutate(SeniorCitizen = ifelse(SeniorCitizen == 0, "No", "Yes"))

#Chcemy, aby Churn było 0-1
WA_Fn_UseC_Telco_Customer_Churn <- WA_Fn_UseC_Telco_Customer_Churn %>% 
  mutate(Churn = ifelse(Churn == "No", 0, 1))
WA_Fn_UseC_Telco_Customer_Churn$Churn <- factor(WA_Fn_UseC_Telco_Customer_Churn$Churn)
