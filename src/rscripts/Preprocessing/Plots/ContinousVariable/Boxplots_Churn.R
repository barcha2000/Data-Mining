#  --Chunk 2--

library(gridExtra)
library(ggplot2)


# Boxploty dla zmiennych ciągłych z podziałem na Churn


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
