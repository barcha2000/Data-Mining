#  --Chunk 1--

library(gridExtra)
library(ggplot2)

# Boxploty dla zmiennych ciągłych

boxplot_tenure <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = "", y = tenure, fill = "tenure")) +
  geom_boxplot() +
  scale_fill_manual(values = c("tenure" = "red")) +
  theme_gray() +
  guides(fill = FALSE) +
  coord_flip()



boxplot_MonthlyCharges <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = "", y = MonthlyCharges, fill = "MonthlyCharges")) +
  geom_boxplot() +
  scale_fill_manual(values = c("MonthlyCharges" = "green")) +
  theme_gray() +
  guides(fill = FALSE) +
  coord_flip()



boxplot_TotalCharges <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = "", y = TotalCharges, fill = "TotalCharges")) +
  geom_boxplot() +
  scale_fill_manual(values = c("TotalCharges" = "blue")) +
  theme_gray() +
  guides(fill = FALSE) +
  coord_flip()


grid.arrange(boxplot_tenure, boxplot_MonthlyCharges, boxplot_TotalCharges, ncol = 1)
