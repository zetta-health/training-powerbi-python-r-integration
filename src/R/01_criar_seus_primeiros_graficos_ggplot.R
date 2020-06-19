# Importar bibliotecas

library(tidyverse)
library(ggpubr)


# Carregar banco de dados
data <- read_csv("data/insurance.csv")

# Ver estrutura do banco de dados
glimpse(data)


# Treino ggplot2 ----------------------------------------------------------

# Diagrama de dispersão
data %>% 
  ggplot(aes(x = age, y = charges)) + 
  geom_point()

# Diagrama de dispersão 2
data %>% 
  ggplot(aes(x = age, y = charges)) + 
  geom_point(alpha = .3) + 
  facet_wrap(~smoker)

# Diagrama de dispersão 3
data %>% 
  ggplot(aes(x = age, y = charges)) + 
  geom_point(alpha = .3) + 
  geom_smooth(method = "lm") +
  facet_wrap(~smoker)


# Histograma
data %>% 
  ggplot(aes(x = age, fill = sex)) +
  geom_density(alpha = .3)

# Boxplot
data %>% 
  ggplot(aes(x = age, fill = sex)) +
  geom_boxplot()

## Treino ggpubr

# Boxplot
ggboxplot(data, x = "smoker", y = "charges",
          color = "sex",
          palette = "npg",
          add = "jitter") +
  stat_compare_means(method = "t.test")
  
# Density plot
ggdensity(data, x = "charges",
          rug = TRUE,
          add = "mean",
          color = "sex", fill = "sex",
          palette = "npg")

# Scatter plot
ggscatter(data, x = "age", y = "charges",color = "smoker",
           palette = "npg",
          size = 1, add = "reg.line", 
          conf.int = TRUE, 
          cor.coef = TRUE)