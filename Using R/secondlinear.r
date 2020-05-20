library(lattice)
wc<-read.csv("C:/Users/sonih/Desktop/WC_AT.csv")
model<-lm(AT~Waist,data=wc)
summary(model)
new<-data.frame(Waist=c(40,80,300))
pred<-predict(model,newdata=new)
pred