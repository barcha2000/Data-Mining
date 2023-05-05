library(dplyr)
library(xtable)

df <- WA_Fn_UseC_Telco_Customer_Churn %>%
  dplyr::select(c("tenure","MonthlyCharges","TotalCharges"))

# wykorzystanie funkcji summary
summary_df <- summary(df)

colnames(summary_df) <- c("n", "Mean", "Std. Dev.", "Min", "Max")

# konwersja na obiekt klasy xtable
xtable_summary <- xtable(summary_df, align = "|r|r|r|r|r|", colnames = c("", "n", "Mean", "Std. Dev.", "Min", "Max"))

# wyświetlenie tabeli
print(xtable_summary, include.rownames = FALSE)