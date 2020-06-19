# Importar bibliotecas

library(tidyverse)
library(rpart)
library(rattle)

# Carregar banco de dados
data <- read_csv("data/insurance.csv")

# Ver estrutura do banco de dados
glimpse(data)

# Arvore de regressao -----------------------------------------------------

model <- rpart(data = data, 
               formula = charges ~ sex + smoker + children + region + bmi,
               control = rpart.control(maxdepth = 3, 
                                       minsplit = 10)
               )

fancyRpartPlot(model, 
               palettes = "BuGn",
               type = 4)
