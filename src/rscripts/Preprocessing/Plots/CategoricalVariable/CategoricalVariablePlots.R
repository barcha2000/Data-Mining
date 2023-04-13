#  --Chunk 5--

library(ggplot2)
library(ggpubr)
library(gridExtra)
library(dplyr)
library(purrr)

# Wybór zmiennych kategorycznych

cat_cols <- WA_Fn_UseC_Telco_Customer_Churn %>%
  select(-customerID, -tenure, -MonthlyCharges, -TotalCharges, -Churn) %>%
  keep(is.character) %>% # wybierz tylko zmienne kategoryczne
  names()

# Barploty dla zmiennych kategorycznych

plots <- lapply(cat_cols, function(col) {
  ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes_string(x = col)) +
    geom_bar(fill = "lightblue")
})

grid.arrange(grobs = plots, ncol = 4)

