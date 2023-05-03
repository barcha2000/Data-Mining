model.logit <-  glm(Churn~., data=WA_Fn_UseC_Telco_Customer_Churn, family=binomial(link="logit"))


#  krótka informacja o dopasowanym modelu
print(model.logit)
summary(model.logit)

#  współczynniki modelu
(wspolczynniki <- coefficients(model.logit))

#  diagnostyka  modelu
(AIC <- model.logit$aic)  # kryterium AIC
(deviance <- model.logit$deviance) # kryterium deviance (=-2log(likelihood))
(deviance.null <- model.logit$null.deviance) #deviance dla modelu referencyjnego (bez zmiennych niezależnych)

# wartości resztowe (residua)
residua <- residuals(model.logit)
plot(residua) # wykres reszt
hist(residua) # histogram

######################################
#  prognozowanie i klasyfikacja

# prognozujemy  prawdopodobieństwo Pr(positive|x)
pred.prob <- predict(model.logit, dane , type = "response")

# wykres (kolor = klasa)
n <- nrow(dane)
p <- ncol(dane)
kolory <- character(n)

kolory[dane$diabetes=="pos"] <- "red"
kolory[dane$diabetes=="neg"] <- "blue"
plot(pred.prob, col=kolory)
legend("topleft",legend=c("positive","negative"), col=c("red","blue"), pch="o", bg="azure2")

hist(pred.prob)   # histogram prognozowanych prawdopodobieństw

# prognozujemy log(odds)
pred.logodds <- predict(model.logit, dane, type = "link")

# wykres (kolor = klasa)
plot(pred.logodds, col=kolory)
hist(pred.logodds)   # histogram prognozowanych log(odds)

# konwersja p-stw na etykietki dla zadanego punktu odciecia (cutoff)
prob2labels <- function(probs,cutoff)
{
  klasy <- rep("neg",length(probs))
  klasy[probs>cutoff] <- "pos"
  return(as.factor(klasy))
}

# etykietki rzeczywiste i prognozowane
lr.labels <- prob2labels(probs=pred.prob,cutoff=0.5)
real.labels <- dane$diabetes

# blad klasyfikacji
conf.matrix <- table(lr.labels, real.labels)
n.test <- n
classif.error <- (n.test - sum(diag(conf.matrix)))/n.test

############################################################################################
#### 6) Wielomianowa regresja logistyczna (multinomial LR) -- klasyfikacja wieloklasowa
############################################################################################

# Wybieramy klasę referencyjną (setosa)
data <- iris 
data$Species <- relevel(data$Species, ref=1)

# wczytujemy wymganą bibliotekę
library(nnet)

# dopasowujemy model (ang. multinomial logistic regression)  
model <- multinom(Species~., data=data)

# podstawowe informacje o modelu
summary(model)

# prognozowanie
pred.lebels <- predict(model, data)

# macierz pomyłek
table(pred.lebels, data$Species)
