import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#%matplotlib qt

# Abrir banco de dados
data = pd.read_csv('data/insurance.csv')

# Inspecionar banco de dados
data.info()


# Diagrama de dispersao 
## Matplotlib
plt.scatter(data.age, data.charges)
plt.show()

## Seaborn
sns.relplot(
        x='charges', 
        y='age', 
        col='smoker',
        hue='sex',
        kind='scatter',
        data=data
        )


# Histograma
## Matplotlib
plt.hist(data.charges)

## Seaborn
sns.distplot(data.age, kde=False, color='b')


# Pairplot
sns.pairplot(data, hue='smoker')
