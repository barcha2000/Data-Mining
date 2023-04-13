#  --Chunk 4--

library(gridExtra)
library(ggplot2)

# Gęstości z podziałem na churn

DensityPlot_tenure_Churn <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = tenure, fill = Churn)) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = c("No" = "green", "Yes" = "red"), name = "Churn") +
  theme_gray()

DensityPlot_MonthlyCharges_Churn <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = MonthlyCharges, fill = Churn)) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = c("No" = "green", "Yes" = "red"), name = "Churn") +
  theme_gray()

DensityPlot_TotalCharges_Churn <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = TotalCharges, fill = Churn)) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = c("No" = "green", "Yes" = "red"), name = "Churn") +
  theme_gray()

grid.arrange(DensityPlot_tenure_Churn, DensityPlot_MonthlyCharges_Churn, DensityPlot_TotalCharges_Churn, ncol = 1)

