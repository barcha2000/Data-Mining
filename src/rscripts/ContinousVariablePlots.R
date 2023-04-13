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

# Boxploty z podziałem na churn

boxplot_tenure_churn <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = Churn, y = tenure, fill = Churn, group = Churn, color = Churn)) +
  geom_boxplot(alpha = 0.5) +
  scale_fill_manual(values = c("Yes" = "red", "No" = "gray")) +
  scale_color_manual(values = c("Yes" = "red", "No" = "gray")) +
  theme_gray() +
  labs(title = "Tenure by Churn", x = "Churn", y = "Tenure") +
  guides(fill = guide_legend(title = "Churn"), color = guide_legend(title = "Churn")) +
  coord_flip()


boxplot_monthly_charges_churn <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = Churn, y = MonthlyCharges, fill = Churn, group = Churn, color = Churn)) +
  geom_boxplot(alpha = 0.5) +
  scale_fill_manual(values = c("Yes" = "green", "No" = "gray")) +
  scale_color_manual(values = c("Yes" = "green", "No" = "gray")) +
  theme_gray() +
  labs(title = "Monthly Charges by Churn", x = "Churn", y = "Monthly Charges") +
  guides(fill = guide_legend(title = "Churn"), color = guide_legend(title = "Churn")) +
  coord_flip()


boxplot_total_charges_churn <- ggplot(WA_Fn_UseC_Telco_Customer_Churn, aes(x = Churn, y = TotalCharges, fill = Churn, group = Churn, color = Churn)) +
  geom_boxplot(alpha = 0.5) +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "gray")) +
  scale_color_manual(values = c("Yes" = "blue", "No" = "gray")) +
  theme_gray() +
  labs(title = "Total Charges by Churn", x = "Churn", y = "Total Charges") +
  guides(fill = guide_legend(title = "Churn"), color = guide_legend(title = "Churn")) +
  coord_flip()


grid.arrange(boxplot_tenure_churn, boxplot_monthly_charges_churn, boxplot_total_charges_churn, ncol = 1)



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




