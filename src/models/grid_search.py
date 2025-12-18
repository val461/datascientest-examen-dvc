import pandas as pd
from sklearn.model_selection import GridSearchCV
from sklearn import svm
import pickle

X_train=pd.read_csv('data/processed_data/X_train_scaled.csv')
y_train=pd.read_csv('data/processed_data/y_train.csv').values.ravel()

parameters = {'kernel':('linear', 'rbf'), 'C':[1, 10]}

svc = svm.SVR()
clf = GridSearchCV(svc, parameters)
clf.fit(X_train, y_train)

with open('models/best_params.pkl', 'wb') as fp:
    pickle.dump(clf.best_params_, fp, protocol=pickle.HIGHEST_PROTOCOL)
