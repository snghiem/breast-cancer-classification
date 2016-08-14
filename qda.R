# Title: Quadratic Discriminant Analysis
# Author: Sony Nghiem

rm(list=ls())
source("dataprep.R")
brcancer = dataprep()
train = brcancer[,33]
brcancer = brcancer[,1:32]

attach(brcancer)
require(MASS) #qda requires MASS, either library(MASS)
qda.fit = qda(Diag~.-ID, data=brcancer, subset=train)
qda.pred = predict(qda.fit, brcancer[!train,])

qda.class = qda.pred$class #the first element contains the benign/malignant tendency of the cancer cell
table(qda.class, Diag[!train])
# test error
mean(qda.class != Diag[!train])
# about 4.9%
detach(brcancer)
