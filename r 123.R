install.packages("ISLR") 
install.packages("caret") 
install.packages("rpart.plot") 
install.packages("tidyverse") 
install.packages("skimr") 

library(ISLR)
library(caret)
library(rpart.plot)
library(tidyverse)
library(skimr)

data<-read.csv("C:\\Users\\acer\\Desktop\\renewable electricity by country.csv")
view(data)
skim_to_wide(data)

tree<-rpart( all.electricity.generation ~ all.renewables.1+non.hydro.renewables,data)
a<- data.frame(all.renewables.1=c(0.9),non.hydro.renewables=c(0.04))
result<- predict(tree,a)
print(result)

tree<-rpart(all.renewables.1 ~ all.electricity.generation+non.hydro.renewables,data)
a<-data.frame(all.electricity.generation=c(1.1),non.hydro.renewables=c(0.04))
result<- predict(tree,a)
print(result)

rpart.plot(tree)


