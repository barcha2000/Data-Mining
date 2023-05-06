library(summarytools)
library(DataExplorer)
library(xtable)

telco <- WA_Fn_UseC_Telco_Customer_Churn %>% 
  select_if(is.numeric)

# create summary table
summary_table <- summary(telco)

# convert to xtable and print
table <- xtable(summary_table)
print(table, comment = FALSE, sanitize.colnames.function = identity)