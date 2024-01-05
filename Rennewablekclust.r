install.packages("stats")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggfortify")

library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

data1 <-read.csv("C:\\Users\\user\\Downloads\\renewable electricity by country.csv",header=TRUE)
View(data1)
data2=select(data1,c(10,11))

wssplot(data2)

KM=kmeans(data2,3)

autoplot(KM,data2,frame=TRUE)
