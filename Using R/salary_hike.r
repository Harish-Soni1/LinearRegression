library(lattice)
salary_data=read.csv("E:/itsstudytym/SLR/Salary_Data SLR.csv")

dotplot(salary_data$Salary, main="Dot Plot of Salary Hike",col="dodgerblue4")
dotplot(salary_data$YearsExperience, main="Dot Plot of YearsExperience", col="dodgerblue4")
boxplot(salary_data$Salary,col="dodgerblue4")
boxplot(salary_data$YearsExperience,col="dodgerblue4")
hist(salary_data$YearsExperience)
hist(salary_data$Salary)

model<-lm(Salary~YearsExperience,data=salary_data)
summary(model)

#Residual standard error: 5788 on 28 degrees of freedom
#Multiple R-squared:  0.957,	Adjusted R-squared:  0.9554 
#F-statistic: 622.5 on 1 and 28 DF,  p-value: < 2.2e-16

plot(model)
car::residualPlots(model)

##iteration1
data1<-salary_data[-c(9,20,24),]
model1<-lm(Salary~log(YearsExperience),data=data1)
summary(model1)

#Residual standard error: 4854 on 25 degrees of freedom
#Multiple R-squared:  0.9703,	Adjusted R-squared:  0.9691 
#F-statistic:   817 on 1 and 25 DF,  p-value: < 2.2e-16

car::residualPlots(model1)

##final model

data_final<-salary_data[-c(9,20,24),] #model1 data
model_final<-lm(Salary~YearsExperience + I(YearsExperience * YearsExperience),data=data_final)
summary(model_final)

#Residual standard error: 4873 on 24 degrees of freedom
#Multiple R-squared:  0.9713,	Adjusted R-squared:  0.9689 
#F-statistic: 405.8 on 2 and 24 DF,  p-value: < 2.2e-16

pred<-predict(model_final,newdata=data.frame(YearsExperience=c(1.5,3.2,5.5)))
pred
