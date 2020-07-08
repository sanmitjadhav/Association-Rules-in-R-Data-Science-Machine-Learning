install.packages("arules")
library("arules") # Used for building association rules i.e. apriori algorithm
data("Groceries")# loading the Groceries Datawere u 
?Groceries
inspect(Groceries[1:10])# showing only top 10 transactions
install.packages("arulesViz")
library("arulesViz") # for visualizing rules

# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules
?apriori
# Building rules using apriori algorithm
arules <- apriori(Groceries, parameter = list(support=0.002,confidence=0.7))
arules
inspect(head(sort(arules,by="lift")))# to view we use inspect 
inspect(sort(arules,by="lift"))
#install.packages("Rtools", force=TRUE)
#library(Rtools)
plotly_arules(arules)

# Different Ways of Visualizing Rules
plot(arules,method="grouped")
write(arules, file="a_rules.csv",sep=",")

#getwd()

