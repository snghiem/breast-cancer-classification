# Title: Logistics Regression
# Author: Sony Nghiem

# make sure the working environment is clean
rm(list=ls()) 

source("dataprep.R")
brcancer = dataprep()
train = brcancer[,33]
brcancer = brcancer[,1:32]

attach(brcancer)
glm.fit = glm(Diag~.-ID, data=brcancer, subset=train, family=binomial) # we don't count on ID as a predictor
# I got warning messages about the algorithm did not converge
# Apparently the fitted probabilities are extremely close to zero or one.

summary(glm.fit)
#Pay attention that there is no variable showing significant z-statistic test.
# At least, this method will not be that accurate.

glm.prob = predict(glm.fit, brcancer[!train,], type="response")

contrasts(Diag) # need to know which value of Diag is 0 and 1
# so here B is 0 and M is 1
glm.pred = ifelse(glm.prob > 0.5, "M", "B")

# Here is the confusion table comparing the logistic prediction with true malignant status
table(glm.pred, Diag[!train])

# error test is
mean(glm.pred != Diag[!train])
# the error test is 6.2%, not bad (above we found out that there is no
# significant z-test on any predictor).

detach(brcancer)