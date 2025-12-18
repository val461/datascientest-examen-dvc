import pandas as pd
from sklearn import svm
import pickle
from sklearn.metrics import mean_squared_error, r2_score
import json

with open('models/trained_model.pkl', 'rb') as handle:
    svc = pickle.load(handle)

X_test=pd.read_csv('data/processed_data/X_test_scaled.csv')
y_test=pd.read_csv('data/processed_data/y_test.csv').values.ravel()

y_pred=svc.predict(X_test)
pd.Series(y_pred).to_csv('data/y_pred.csv', index=False)

scores = {'mse': mean_squared_error(y_test, y_pred),'r2': r2_score(y_test, y_pred)}
with open("metrics/scores.json", "w") as outfile:
    json.dump(scores, outfile)
