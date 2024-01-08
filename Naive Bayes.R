data <- read.csv("C:\\Users\\ASUS\\OneDrive\\Desktop\\R\\test.csv")
data
library(e1071)
library(caret)
library(caTools)


split_ratio <- sample.split(data,SplitRatio = 0.750)
traning_dataset <- subset(data,split_ratio==TRUE)
dim(traning_dataset)
testing_dataset <- subset(data,split_ratio==FALSE)
dim(testing_dataset)

set.seed(150)
model<- naiveBayes(SaleCondition~., data = traning_dataset)



predicted_results <- predict(model , newdata = testing_dataset)
table(predicted_results)

levels(factor(predicted_results))
levels(factor(testing_dataset$SaleCondition))
predicted_results<- as.factor(predicted_results)
testing_dataset$SaleCondition<-as.factor(testing_dataset$SaleCondition)
predicted_results<-factor(predicted_results)
testing_dataset$sale_condition<- factor(testing_dataset$SaleCondition)
levels(predicted_results) <- levels(testing_dataset$SaleCondition)
levels(predicted_results)
levels(testing_dataset$SaleCondition)

conf_table <- table(predicted_results, testing_dataset$SaleCondition)
conf_table

confusionMatrix(conf_table)

matrix <- table(predicted_results,testing_dataset$SaleCondition)
confusionMatrix(matrix)

#pre processing
#ommiting
sum(is.na(data))
colSums((is.na(data)))
dim(data)
data1<- na.omit(data)
dim(data1)

#encoding

data1$LotArea <- as.factor(data1$LotArea)
data1$Street <- as.factor(data1$Street)
data1$LotShape <- as.factor(data1$LotShape)
data1$LandContour <- as.factor(data1$LandContour)
data1$LotConfig <- as.factor(data1$LotConfig)
data1$LandSlope <- as.factor(data1$LandSlope)
data1$Neighborhood <- as.factor(data1$Neighborhood)
data1$BldgType <- as.factor(data1$BldgType)
data1$HouseStyle <- as.factor(data1$HouseStyle)
data1$OverallQual <- as.factor(data1$OverallQual)
data1$OverallCond <- as.factor(data1$OverallCond)
data1$YearBuilt <- as.factor(data1$YearBuilt)
data1$YearRemodAdd <- as.factor(data1$YearRemodAdd)
data1$RoofStyle <- as.factor(data1$RoofStyle)
data1$RoofMatl <- as.factor(data1$RoofMatl)
data1$Foundation <- as.factor(data1$Foundation)
data1$BsmtQual <- as.factor(data1$BsmtQual)
data1$BsmtCond <- as.factor(data1$BsmtCond)
data1$FullBath <- as.factor(data1$FullBath)
data1$BedroomAbvGr <- as.factor(data1$BedroomAbvGr)
str(data1)


#omitting columns
data2<- data1[ -c(which(colnames(data1) %in% c("LotArea","Fence")))]
str(data2)




#cleaned data into the model

split_ratio <- sample.split(data2,SplitRatio = 0.75)
traning_dataset <- subset(data2,split_ratio==TRUE)
dim(traning_dataset)
testing_dataset <- subset(data2,split_ratio==FALSE)
dim(testing_dataset)

set.seed(100)
model<- naiveBayes(SaleCondition~., data = traning_dataset)


predicted_results <- predict(model , newdata = testing_dataset)
table(predicted_results)


levels(factor(predicted_results))
levels(factor(testing_dataset$SaleCondition ))
predicted_results<- as.factor(predicted_results)
testing_dataset$SaleCondition<-as.factor(testing_dataset$SaleCondition)
predicted_results<-factor(predicted_results)
testing_dataset$SaleCondition<- factor(testing_dataset$SaleCondition)
levels(predicted_results) <- levels(testing_dataset$SaleCondition)
levels(predicted_results)
levels(testing_dataset$SaleCondition)




data <- na.omit(data)

length(predicted_results)
length(testing_dataset$SaleCondition)


conf_table <- table(predicted_results, testing_dataset$SaleCondition)
conf_table

confusionMatrix(conf_table)


length(predicted_results)
length(testing_dataset$SaleCondition)

data <- na.omit(data)

testing_subset <- testing_dataset[rownames(predicted_results), ]


actual_factor <- factor(testing_subset$SaleCondition, levels = levels(predicted_results))


conf_table <- table(predicted_results, actual_factor)

