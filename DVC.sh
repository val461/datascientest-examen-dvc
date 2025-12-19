dvc stage add -n split \
              -d src/data/split.py -d data/raw_data \
              -o data/processed_data/X_train.csv -o data/processed_data/X_test.csv -o data/processed_data/y_train.csv -o data/processed_data/y_test.csv \
              python src/data/split.py

# TODO: specify output files, not folder
dvc stage add -n normalize \
              -d src/data/normalize.py -d data/processed_data/X_train.csv -d data/processed_data/X_test.csv \
              -o data/processed_data \
              python src/data/normalize.py
