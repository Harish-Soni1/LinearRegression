import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split

## delivery dataset

df=pd.read_csv("E:\\itsstudytym\\assignments\\SLR\\delivery_time SLR.csv")

df.head()

X=df.iloc[:,1:]

y=df.iloc[:,:1]

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=0)

from sklearn.linear_model import LinearRegression

SLR=LinearRegression()

SLR.fit(X_train,y_train)

y_predict=SLR.predict(X_test)

y_predict

y_test

from sklearn.metrics import r2_score
score=r2_score(y_test,y_predict)
score

plt.scatter(X_train,y_train)
plt.plot(X_train,SLR.predict(X_train))
plt.show()
