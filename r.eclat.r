# Eclat #gives items frequently bought together #gives simple results with few parameters(simplified version of apriori model)

# Data Preprocessing
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv')
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Eclat on the dataset
rules = eclat(data = dataset, parameter = list(support = 0.003, minlen = 2)) #gives sets of items not rules

# Visualising the results
inspect(sort(rules, by = 'support')[1:10])