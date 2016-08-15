# Title: K-Nearest Neighbors
# Author: Sony Nghiem

rm(list=ls())
source("dataprep.R")
brcancer = dataprep()

#divide the dataset into training and testing samples
require(caTools)
set.seed(1)
train = sample.split(brcancer$ID, SplitRatio = 0.75)

attach(brcancer)
library(class) #need this library for knn
train.X = brcancer[3:32][train,] # predictors for the training set
test.X = brcancer[3:32][!train,] # predictors for the testing set
train.Y = Diag[train]            # predictants for the training set

set.seed(2) # if several observations are tied as nearest neighbors, R might randomly choose one

# 1 nearest neighbor
knn.pred =knn(train.X, test.X, train.Y, k=1) 
table(knn.pred, Diag[!train])
mean(knn.pred != Diag[!train]) #test error will be 9.1 %

# 10 nearest neighbor
knn.pred =knn(train.X, test.X, train.Y, k=10) 
table(knn.pred, Diag[!train])
mean(knn.pred != Diag[!train]) #test error will be 7.7 %

# 5 nearest neighbor
knn.pred =knn(train.X, test.X, train.Y, k=5) 
table(knn.pred, Diag[!train])
mean(knn.pred != Diag[!train]) #test error will be 5.6 %

# 10 nearest neighbor
knn.pred =knn(train.X, test.X, train.Y, k=10) 
table(knn.pred, Diag[!train])
mean(knn.pred != Diag[!train]) #test error will be 6.3 %

detach(brcancer)
