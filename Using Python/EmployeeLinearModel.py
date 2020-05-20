import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

#Employee Dataset

df2=pd.read_csv("E:\\itsstudytym\\assignments\\SLR\\emp_data SLR.csv")

df2.head()

X=df2.iloc[:,:1]

y=df2.iloc[:,1:]

from sklearn.model_selection import train_test_split

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=False)

from sklearn.linear_model import LinearRegression

SLR=LinearRegression()

SLR.fit(X_train,y_train)

y_pred=SLR.predict(X_test)

from sklearn.metrics import r2_score
score=r2_score(y_test,y_pred)
print(score)

plt.scatter(X_train,y_train)
plt.plot(X_train,SLR.predict(X_train))
plt.show()
