import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

#Salary Dataset

df3=pd.read_csv("E:\\itsstudytym\\assignments\\SLR\\Salary_Data SLR.csv")

df3.head()

X=df3.iloc[:,:1]

y=df3.iloc[:,1:]

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=False)

from sklearn.linear_model import LinearRegression
SLR=LinearRegression()

SLR.fit(X_train,y_train)

y_pred=SLR.predict(X_test)
print(y_pred)

score=r2_score(y_test,y_pred)
print(score)

plt.scatter(X_train,y_train)
plt.plot(X_train,SLR.predict(X_train))
plt.show()
