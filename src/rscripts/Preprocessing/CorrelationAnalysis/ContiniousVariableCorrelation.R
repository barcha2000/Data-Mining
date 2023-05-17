#  --Chunk 7--

library(xtable)

# Wybieramy tylko zmienne ciągłe
continuous_vars <- WA_Fn_UseC_Telco_Customer_Churn %>% 
  select_if(is.numeric)

# Obliczamy macierz korelacji
cor_matrix <- cor(continuous_vars)

# Wyświetlamy wynik
tab <- xtable(cor_matrix, digits = 2)
print(tab, comment = FALSE)
