#  --Chunk 3--

library(gridExtra)
library(ggplot2)

# Gęstości dla zmiennych ciągłych

DensityPlot_tenure <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = tenure, fill = "tenure")) +
  geom_density(alpha = 0.5, color = "red") +
  scale_fill_manual(values = c("tenure" = "red")) +
  theme_gray() +
  guides(fill = FALSE)

DensityPlot_MonthlyCharges <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = MonthlyCharges, fill = "MonthlyCharges")) +
  geom_density(alpha = 0.5, color = "green") +
  scale_fill_manual(values = c("MonthlyCharges" = "green")) +
  theme_gray() +
  guides(fill = FALSE)

DensityPlot_TotalCharges <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = TotalCharges, fill = "TotalCharges")) +
  geom_density(alpha = 0.5, color = "blue") +
  scale_fill_manual(values = c("TotalCharges" = "blue")) +
  theme_gray() +
  guides(fill = FALSE)

grid.arrange(DensityPlot_tenure, DensityPlot_MonthlyCharges, DensityPlot_TotalCharges, ncol = 1)

