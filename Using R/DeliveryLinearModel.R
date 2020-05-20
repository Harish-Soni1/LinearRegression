library(lattice)
delivery_data<-read.csv("E:/itsstudytym/SLR/delivery_time SLR.csv")

dotplot(delivery_data$Delivery.Time, main="Dot Plot of Delivery.Time",col="dodgerblue4")
dotplot(delivery_data$Sorting.Time, main="Dot Plot of Sorting.Time", col="dodgerblue4")
boxplot(delivery_data$Delivery.Time,col="dodgerblue4")
boxplot(delivery_data$Sorting.Time,col="dodgerblue4")
hist(delivery_data$Delivery.Time)
hist(delivery_data$Sorting.Time)

model<-lm(Delivery.Time~Sorting.Time,data=delivery_data)
summary(model)

#Residual standard error: 2.935 on 19 degrees of freedom
#Multiple R-squared:  0.6823,	Adjusted R-squared:  0.6655 
#F-statistic:  40.8 on 1 and 19 DF,  p-value: 3.983e-06

plot(model)

##iteration1
data1=delivery_data[-c(5,9,21),]
model1<-lm(Delivery.Time~log(Sorting.Time),data=data1)
summary(model1)

#Residual standard error: 1.814 on 16 degrees of freedom
#Multiple R-squared:  0.8378,	Adjusted R-squared:  0.8276 
#F-statistic: 82.62 on 1 and 16 DF,  p-value: 1.019e-07

plot(model1)

##iteration2
data2=delivery_data[-c(3,4,5,9,10,21),]
model2<-lm(Delivery.Time~Sorting.Time + I(Sorting.Time*Sorting.Time),data=data2)
summary(model2)

#Residual standard error: 1.399 on 12 degrees of freedom
#Multiple R-squared:  0.8919,	Adjusted R-squared:  0.8739 
#F-statistic: 49.52 on 2 and 12 DF,  p-value: 1.593e-06

plot(model2)

##iteration3
data3=delivery_data[-c(3,4,5,9,10,12,16,17,21),]
model3<-lm(log(Delivery.Time)~Sorting.Time + I(Sorting.Time*Sorting.Time) + I(Sorting.Time*Sorting.Time*Sorting.Time),data=data3)
summary(model3)

#Residual standard error: 0.08061 on 8 degrees of freedom
#Multiple R-squared:  0.9504,	Adjusted R-squared:  0.9319 
#F-statistic: 51.15 on 3 and 8 DF,  p-value: 1.454e-05

pred<-predict(model3,newdata = data.frame(Sorting.Time=c(5,8,13)))
pred
