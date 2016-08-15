# Title: Linear Discriminant Analysis
# Author: Sony Nghiem

rm(list=ls())
source("dataprep.R")
brcancer = dataprep()

#divide the dataset into training and testing samples
require(caTools)
set.seed(1)
train = sample.split(brcancer$ID, SplitRatio = 0.75)

attach(brcancer)
require(MASS) #lda requires MASS, either library(MASS)
lda.fit = lda(Diag~.-ID, data=brcancer, subset=train)
lda.pred = predict(lda.fit, brcancer[!train,])

# Here is the result: [1] "class"   "posterior"   "x" 

lda.class = lda.pred$class #the first element contains the benign/malignant tendency of the cancer cell
table(lda.class, Diag[!train])
# test error
mean(lda.class != Diag[!train])
#which is about 4.2%, even less than the logistic regression model. Pretty good!!
detach(brcancer)
