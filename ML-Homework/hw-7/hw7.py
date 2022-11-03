# import necessary libraries for the naive-bayes
# classifier

import numpy as np
import pandas as pd

df = pd.read_csv('dataset_for_naive_bayes.csv')
# Perhaps you can print a preview of the data and then have the program
# ask what columns you want to keep
# /ask how many features you want to use
# Then specify which column contains the 0/1
X = df.drop(['y'], axis=1)
y = df['y']

# Need to plot the original data, go ahead and do it with the markers so that you 
# can reference
# isone = (y=='Purchased') # Creating a mask for plotting classification
# plt.figure
# plt.plot(data.X1(isone),data.X2(isone),'o' ,'MarkerEdgeColor', 'black','MarkerFaceColor', 'green');
# hold on
# % plot data with y=0
# plt.plot(data.X1(~isone),data.X2(~isone),'o' ,'MarkerEdgeColor', 'black','MarkerFaceColor', 'red');
# hold off
# axis([-.7 .4 -.7 .7]);
# xlabel('x_1');
# ylabel('x_2');
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X, y, test_size=0.3, random_state=7)
from sklearn.naive_bayes import GaussianNB

#Create a Gaussian Classifier
model= GaussianNB()

# Training the model with training sets
model.fit(X_train,y_train)
train_acc = model.score(X_train,y_train)
test_acc = model.score(X_test,y_test)
## This is the end of the 
print(train_acc)
print('\n')
print(test_acc)

# Need to plot test data and training data with the decision boundaries
