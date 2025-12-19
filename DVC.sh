dvc stage add -n split \
              -d src/data/split.py -d data/raw_data/raw.csv \
              -o data/processed_data/X_train.csv -o data/processed_data/X_test.csv -o data/processed_data/y_train.csv -o data/processed_data/y_test.csv \
              python src/data/split.py

dvc stage add -n normalize \
              -d src/data/normalize.py -d data/processed_data/X_train.csv -d data/processed_data/X_test.csv \
              -o data/processed_data/X_train_scaled.csv -o data/processed_data/X_test_scaled.csv \
              python src/data/normalize.py

dvc stage add -n grid_search \
              -d src/models/grid_search.py -d data/processed_data/X_train_scaled.csv -d data/processed_data/y_train.csv \
              -o models/best_params.pkl \
              python src/models/grid_search.py

dvc stage add -n train \
              -d src/models/train.py -d models/best_params.pkl -d data/processed_data/X_train_scaled.csv -d data/processed_data/y_train.csv \
              -o models/trained_model.pkl \
              python src/models/train.py

dvc stage add -n eval \
              -d models/trained_model.pkl -d data/processed_data/X_test_scaled.csv -d data/processed_data/y_test.csv \
              -o data/y_pred.csv -M metrics/scores.json \
              python src/models/eval.py

# TODO
