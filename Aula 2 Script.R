# Aula 2 

# Instalando e Carregando os Pacotes necessários 

install.packages('MASS')
install.packages('wooldridge')
install.packages('plm')

library(MASS)
library(wooldridge)
library(plm)

# Carregando a base de dados 1

data(birthwt)

# Deixo aqui os comandos para voces testarem nas bases de dados: 

head(dados)
dim(dados)
nrow(dados)
ncol(dados)
str(dados)

summary(dados)
class(dados)
unique(dados$estado)
sum(is.na(dados))

# Regressão OLS

modelo1 <- lm(low ~ smoke+ ht, data = birthwt)

summary(modelo1)

# Carregando a base de dados 2

data(crime4)

# Deixo aqui os comandos para voces testarem nas bases de dados: 

head(dados)
dim(dados)
nrow(dados)
ncol(dados)
str(dados)

summary(dados)
class(dados)
unique(dados$estado)
sum(is.na(dados))

# Regressão Efeitos Fixos 

modelo_fx <- plm(lcrmrte ~ lprbarr + lprbconv + lprbpris + lavgsen + 
                   lpolpc + ldensity + lpctymle + lwcon + 
                   lwtrd + lwser, 
                 data = crime4,
                 index = c("county", "year"),
                 model = "within")

summary(modelo_fx)