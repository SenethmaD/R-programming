install.packages("stats")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggfortify")

library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

dataa <-read.csv("C:\\Users\\user\\Downloads\\test.csv",header=TRUE)
View(dataa)
str(dataa)
datab=select(dataa,c(20,21))

wssplot(datab)

KM=kmeans(datab,2)

autoplot(KM,datab,frame=TRUE)
