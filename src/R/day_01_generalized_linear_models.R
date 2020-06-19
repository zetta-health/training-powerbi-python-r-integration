# Generalized Linear Models
# Grupo de estudos

library(lgrdata)
library(ggpubr)
library(sjPlot)
library(sjlabelled)
library(sjmisc)
library(caret)
library(corrplot)
library(GGally)

data("icecream")

str(icecream)

# Boxplot
ggboxplot(icecream, x = "location", y = "sales",
          color = "location",
          palette = "npg",
          add = "jitter") +
  stat_compare_means(method = "t.test")

# Density plot
ggdensity(icecream, x = "sales",
          rug = TRUE,
          add = "mean",
          color = "location", fill = "location",
          palette = "npg")


# Scatter plot
ggscatter(icecream, x = "sales", y = "temperature",
           palette = "npg",
          size = 3, add = "reg.line")

lm <- lm(icecream, formula = sales ~ temperature)
summary(lm)
tab_model(lm)

lm2 <- lm(icecream, formula = sales ~ temperature + location)
summary(lm2)
tab_model(lm2)

anova(lm, lm2)


# Worked example ----------------------------------------------------------

data <- read.csv("~/Downloads/insurance.csv")

gghistogram(data, x = "charges",
            palette = "npg",add = "mean",
            rug = TRUE)

gghistogram(data, x = "charges", fill = "sex",
            palette = "npg",add = "mean",
            rug = TRUE)

ggdensity(data, x = "charges", fill = "region",
            palette = "npg",add = "mean",
            rug = TRUE)

ggscatter(data, x = "charges", y = "age",
          color = "smoker",
           palette = "npg",
          size = 3)

ggscatter(data, x = "charges", y = "bmi",
          palette = "npg",
          color = "smoker",
          size = 3)

cor_matrix <- cor(data[, c("age", "bmi", "children", "charges")])
ggcorr(cor_matrix,
       geom = "blank", label = TRUE, hjust = 0.75) +
  geom_point(size = 10,
             aes(color = coefficient > 0, alpha = abs(coefficient) > 0.5)) +
  scale_alpha_manual(values = c("TRUE" = 0.25, "FALSE" = 0)) +
  guides(color = FALSE, alpha = FALSE)


# Linear model ------------------------------------------------------------

baseline <- lm(charges ~ ., data = data)


# Improved model -----------------------------------------------------------
data$bmi_m30 <- ifelse(data$bmi >= 30, "yes", "no")
data$age_2 <- data$age^2

# interaction
ggscatter(data, x = "charges", y = "age_2",
          palette = "npg",
          color = "bmi_m30",
          size = 3)

model_interaction <- lm(charges  ~ age + sex + bmi + children +
                          smoker + region + age_2 + bmi_m30 + bmi_m30:smoker,
                        data = data)

summary(model_interaction)

plot(model_interaction$fitted.values, model_interaction$model$charges)
