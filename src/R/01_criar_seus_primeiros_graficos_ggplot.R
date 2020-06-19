# importar bibliotecas

library(tidyverse)
library(ggpubr)


# carregar banco de dados
data <- read_csv("data/insurance.csv")

# ver estrutura do banco de dados
glimpse(data)


# Treino ggplot2 ----------------------------------------------------------


# Histograma
data %>% 
  ggplot(aes(x=age, fill=sex)) +
  geom_density()

# Boxplot
data %>% 
  ggplot(aes(x=age, fill=sex)) +
  geom_boxplot()

# Diagrama de dispersão
data %>% 
  ggplot(aes(x = age, y = charges)) + 
  geom_point()

# Diagrama de dispersão 2
data %>% 
  ggplot(aes(x = age, y = charges)) + 
  geom_point() + 
  facet_grid( ~ bmi)
