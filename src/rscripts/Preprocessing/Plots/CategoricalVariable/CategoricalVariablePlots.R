#  --Chunk 5--

library(ggplot2)
library(ggpubr)
library(gridExtra)
library(dplyr)
library(purrr)
library(tidyr)

# Wybór zmiennych kategorycznych
cat_cols1 <- WA_Fn_UseC_Telco_Customer_Churn %>%
  select(gender,SeniorCitizen,Partner,Dependents) %>%
  keep(is.character) %>% 
  names()

cat_cols2 <- WA_Fn_UseC_Telco_Customer_Churn %>%
  select(PhoneService,MultipleLines,InternetService,OnlineSecurity) %>%
  keep(is.character) %>% 
  names()

cat_cols3 <- WA_Fn_UseC_Telco_Customer_Churn %>%
  select(OnlineBackup,DeviceProtection,TechSupport,StreamingTV) %>%
  keep(is.character) %>% 
  names()

cat_cols4 <- WA_Fn_UseC_Telco_Customer_Churn %>%
  select(StreamingMovies,Contract,PaperlessBilling,PaymentMethod) %>%
  keep(is.character) %>% 
  names()

# Barploty dla zmiennych kategorycznych
plots1 <- lapply(cat_cols1, function(col) {
  p <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes_string(x = col, fill = WA_Fn_UseC_Telco_Customer_Churn$Churn)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
    labs(title = col)
  # dodanie etykiet z liczbą obserwacji
  p + geom_text(stat='count', aes(label=..count..), position=position_stack(0.5))
})

#grid.arrange(grobs = plots1, ncol = 2)

plots2 <- lapply(cat_cols2, function(col) {
  p <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes_string(x = col, fill = WA_Fn_UseC_Telco_Customer_Churn$Churn)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
    labs(title = col)
  # dodanie etykiet z liczbą obserwacji
  p + geom_text(stat='count', aes(label=..count..), position=position_stack(0.5))
})

#grid.arrange(grobs = plots1, ncol = 2)

plots3 <- lapply(cat_cols3, function(col) {
  p <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes_string(x = col, fill = WA_Fn_UseC_Telco_Customer_Churn$Churn)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
    labs(title = col)
  # dodanie etykiet z liczbą obserwacji
  p + geom_text(stat='count', aes(label=..count..), position=position_stack(0.5))
})

#grid.arrange(grobs = plots1, ncol = 2)

plots4 <- lapply(cat_cols4, function(col) {
  p <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes_string(x = col, fill = WA_Fn_UseC_Telco_Customer_Churn$Churn)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
    labs(title = col)
  # dodanie etykiet z liczbą obserwacji
  p + geom_text(stat='count', aes(label=..count..), position=position_stack(0.5))
})

#grid.arrange(grobs = plots1, ncol = 2)

