library(lattice)
calory_data<-read.csv("E:/itsstudytym/SLR/calories_consumed SLR.csv")

dotplot(calory_data$Weight, main="Dot Plot of Weight Gain",col="dodgerblue4")
dotplot(calory_data$Calories, main="Dot Plot of Calories Consumed", col="dodgerblue4")
boxplot(calory_data$Weight,col="dodgerblue4")
boxplot(calory_data$Calories,col="dodgerblue4")
hist(calory_data$Weight)
hist(calory_data$Calories)

model<-lm(Weight~Calories,data=calory_data)
summary(model)

#Residual standard error: 111.6 on 12 degrees of freedom
#Multiple R-squared:  0.8968,	Adjusted R-squared:  0.8882 
#F-statistic: 104.3 on 1 and 12 DF,  p-value: 2.856e-07

plot(model)

##iteration1
data1<-calory_data[-c(2,7,13),]
model1<-lm(Weight~Calories + I(Calories * Calories),data=data1)
summary(model1)


#Residual standard error: 75.53 on 8 degrees of freedom
#Multiple R-squared:  0.9663,	Adjusted R-squared:  0.9579 
#F-statistic: 114.8 on 2 and 8 DF,  p-value: 1.284e-06

new<-data.frame(Calories=c(1500,2100,1550))
pred<-predict(model,newdata=new)
pred