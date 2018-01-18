# Apriori 

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Data Preprocessing   #apriori is a special type of machine learning model
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header = None)

 #to build list of lists from the dataframe -to use apriori function 
transactions = [] #to loop over all the transactions and to loop over all the products in each transaction
for i in range(0,7501):
    transactions.append([str(dataset.values[i,j]) for j in range(0,20)]) #apriori expects products to be in strings(it will be in quotes)
     
# Training Apriori on the dataset
from apyori import apriori  
rules = apriori(transactions, min_support = 0.003, min_confidence = 0.2, min_lift = 3, min_length = 2) #(3*7/7500)

# Visualising the results
results = list(rules)    #we dont sort here-as its already sorted by their relevance- its relevant criterion-combination of support,confidence and lift

myResults = [list(x) for x in results]  
myRes = []             
for j in range(0, 153):
    myRes.append([list(x) for x in myResults[j][2]])
