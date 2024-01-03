#data visualization

library(ggplot2)

data<- read.csv("C:\\Users\\senet\\OneDrive\\Desktop\\R lang\\test.csv")
data
str(data)

#omitting missing values 
omitting<- is.na(data)
data[! omitting]

#calculating the coefficients and the constant
regmodel1 <- lm(YearBuilt ~ YearRemodAdd, data=data)
coef(regmodel1)

#linear regression
x<-data$YearBuilt
y<-data$MasVnrArea
plot(x,y,main = "Year Built vs Area",xlab = "Year", ylab = "Area",pch=20)
abline(lm(y~x, data = data),col="blue")#adds a blue line representing the linear regression fit.
lines(lowess(x,y),col="red")#adds a red line representing the lowess smooth fit

#box plot
ggplot(data=data,aes(x=data$MasVnrType,y=data$YearBuilt,fill=data$MasVnrType),)+geom_boxplot(outlier.shape = TRUE) +geom_point(size=0.25)

#bar plot
ggplot(data = data, aes(x=data$MasVnrType,fill=data$MasVnrType))+geom_bar(width = .90, show.legend = FALSE)

#histogram
qplot(x=data$YearBuilt,geom = "histogram",xlab = "Year",main = "Histogram using year built",col=I("red"),fill=I("pink"))

#frequency polygon
qplot(x=data$YearBuilt,geom = "freqpoly",xlab = "Year",main = "Frequency using year built",col=I("red"))



