import pandas as pd
from sklearn import svm
import pickle

with open('models/best_params.pkl', 'rb') as handle:
    parameters = pickle.load(handle)

X_train=pd.read_csv('data/processed_data/X_train_scaled.csv')
y_train=pd.read_csv('data/processed_data/y_train.csv').values.ravel()

svc = svm.SVR(**parameters)
svc.fit(X_train, y_train)

with open('models/trained_model.pkl', 'wb') as fp:
    pickle.dump(svc, fp, protocol=pickle.HIGHEST_PROTOCOL)
