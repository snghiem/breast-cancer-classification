# Data cleaning for breast cancer data
# Author: Sony Nghiem

dataprep = function() {

  # read the data of breast cancer from UCI
  # brcancer = read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data", method ="libcurl"), header=FALSE)
  # or use the following once the data is downloaded and saved as a csv file
  # remember to set the working directory (setwd())
  brcancer = read.csv("wdbc.csv", header=FALSE)
  
  summary(brcancer)
  # So we have 32 variables, the first one is an ID number 
  # the second shows the diagnosis of M (Malignant) or B (Benign)
  # the rest are real-valued features computed for each cell nucleus
  
  #change the first two variables' names
  names(brcancer)[1:2] = c("ID","Diag")
  
  #divide the dataset into training and testing samples
  require(caTools)
  set.seed(1)
  train = sample.split(brcancer$ID, SplitRatio = 0.75)
  
  # remember to return the value in R function
  return(cbind(brcancer,train))
}
