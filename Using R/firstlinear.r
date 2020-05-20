install.packages("lattice")
library(lattice)
nd<-read.csv("C:/Users/sonih/Documents/NewspaperData.csv")

dotplot(nd$sunday, main="Dot Plot of Sunday Circulations",col="dodgerblue4")
dotplot(Nd$daily, main="Dot Plot of Daily Circulations", col="dodgerblue4")
boxplot(nd$sunday,col="dodgerblue4")
boxplot(Nd$daily,col="dodgerblue4")

model<-lm(sunday~daily,data=nd)
summary(model)

new<-data.frame(daily=c(200,350,240))
pred<-predict(model,newdata=new)
pred
