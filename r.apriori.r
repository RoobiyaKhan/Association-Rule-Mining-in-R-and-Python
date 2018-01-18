# Apriori #gives people who bought this also bought
                                      
# Data Preprocessing  #package to build Apriori model is arules
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

#install.packages('arules') #arules doesnt take input as csv files, it takes sparse matrix(containing large no of 0s)
library(arules)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset
rules = apriori(data = dataset,parameter = list(support = 0.003, confidence = 0.2)) #support =3*7/7500-products bought 
                                                #3 times a day for 7 days divided by all transactions for that week
                                                #confidence - depends on business goals- arbitrary choice
                                                #both support and confidence - works on trial method,later we can change based on our goals(sales increase or revenue increase)
# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])