install.packages("readxl")
#prediction for male
library(readxl)
ins1<-read_excel("C:/Users/sonih/Documents/insurance.xls",sheet="Male")
bmi=ins1$bmi
charges=ins1$charges
model<-lm(charges~bmi,data=ins1)
summary(model1)
new<-data.frame(bmi=c(22,29,45))
pred<-predict(model,newdata=new)
pred

#prediction for female
library(readxl)
ins2<-read_excel("C:/Users/sonih/Documents/insurance.xls",sheet="Female")
bmi=ins1$bmi
charges=ins1$charges
model2<-lm(charges~bmi,data=ins2)
summary(model2)
new2<-data.frame(bmi=c(22,29,45))
pred2<-predict(model2,newdata=new2)
pred2