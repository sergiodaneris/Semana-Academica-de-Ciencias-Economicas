# Aula 1 

# Instalação e Carregamento de Pacotes no R 

install.packages ('readxl')
install.packages ('haven')
install.packages ('jsonlite')

# Carregando os Pacotes 

library(readxl)
library(haven)
library(jsonlite)

# Carregando as Bases de dados

cattaneo2CSV <- read.csv('C:/Users/sergi/Desktop/Faculdade/Semana Academica Economia/Curso Sergio/base de dados/cattaneo2.csv')

cattaneo2XLS <- read_excel('C:/Users/sergi/Desktop/Faculdade/Semana Academica Economia/Curso Sergio/base de dados/cattaneo2.xlsx')

cattaneo2DTA <- read_dta('C:/Users/sergi/Desktop/Faculdade/Semana Academica Economia/Curso Sergio/base de dados/cattaneo2.dta')

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

# Carregando o pacote dplyr e Lubridate 

install.packages('dplyr')
install.packages('lubridate')


library(dplyr)
library(lubridate)


# Carregando as Bases de dados 2

PESSOASFUNDAMENT <- read.csv('C:/Users/sergi/Desktop/Faculdade/Semana Academica Economia/Curso Sergio/base de dados/PESSOASFUNDAMENT.csv')

PESSOASENSMEDIO <- read.csv('C:/Users/sergi/Desktop/Faculdade/Semana Academica Economia/Curso Sergio/base de dados/PESSOASENSMEDIO.csv')

# Visualizando as Bases de dados 

head(PESSOASFUNDAMENT)
head(PESSOASENSMEDIO)

# Manipulando as bases de dados 

# Transformando a coluna data no formato date 

PESSOASFUNDAMENT <- PESSOASFUNDAMENT %>%
mutate(date = ymd(date))

head(PESSOASFUNDAMENT)

# Filtrando para o ano de 2024 

PESSOASFUNDAMENT2 <- PESSOASFUNDAMENT %>%
filter(year(date) == 2024)

head(PESSOASFUNDAMENT2)

# Filtrando para valores acima de 30.0 na coluna Value 

PESSOASFUNDAMENT3 <- PESSOASFUNDAMENT %>% filter(value > 30.0)

head(PESSOASFUNDAMENT3)

# Criando a coluna mes e ano 

ESSOASFUNDAMENT4 <- PESSOASFUNDAMENT %>%
mutate(
date = ymd(date),      # converte a coluna para data
ano = year(date),      # extrai o ano
mes = month(date))      # extrai o mês

head(PESSOASFUNDAMENT4)

#Agrupando por ID e Tempo 

PESSOASFUNDAMENT5 <- PESSOASFUNDAMENT4 %>%
group_by(uname, ano, mes) %>%
summarise(media = mean(value, na.rm = TRUE))

head(PESSOASFUNDAMENT5)


