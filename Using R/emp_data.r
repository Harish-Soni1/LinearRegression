library(lattice)
emp_data<-read.csv("E:/itsstudytym/SLR/emp_data SLR.csv")

dotplot(emp_data$Churn_out_rate, main="Dot Plot of Churn_out_rate",col="dodgerblue4")
dotplot(emp_data$Salary_hike, main="Dot Plot of Salary_hike", col="dodgerblue4")
boxplot(emp_data$Churn_out_rate,col="dodgerblue4")
boxplot(emp_data$Salary_hike,col="dodgerblue4")
hist(emp_data$Salary_hike)
hist(emp_data$Churn_out_rate)

model<-lm(Churn_out_rate~Salary_hike,data=emp_data)
summary(model)

#Residual standard error: 4.469 on 8 degrees of freedom
#Multiple R-squared:  0.8312,	Adjusted R-squared:  0.8101 
#F-statistic:  39.4 on 1 and 8 DF,  p-value: 0.0002386

plot(model)

##iteration1
data1<-emp_data[-c(1,5,10),]
model1<-lm(Churn_out_rate~log(Salary_hike),data=data1)
summary(model1)

#Residual standard error: 2.432 on 5 degrees of freedom
#Multiple R-squared:  0.928,	Adjusted R-squared:  0.9136 
#F-statistic: 64.45 on 1 and 5 DF,  p-value: 0.0004848

plot(model1)

##iteration2
data2<-emp_data[-c(1,2,5,8,9,10),]
model2<-lm(log(Churn_out_rate)~Salary_hike,data=data2)
summary(model2)

#Residual standard error: 0.008273 on 2 degrees of freedom
#Multiple R-squared:  0.9914,	Adjusted R-squared:  0.9871 
#F-statistic: 230.3 on 1 and 2 DF,  p-value: 0.004313

##final model
data_final<-emp_data[-c(1,2,5,8,9,10),] #model2 data
model_final<-lm(log(Churn_out_rate)~Salary_hike,data=data_final)

pred<-predict(model_final,newdata = data.frame(Salary_hike=c(1530,1650,1680)))
pred
