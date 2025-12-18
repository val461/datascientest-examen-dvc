# TODO
dvc stage add -n split \
              -d src/data/split.py -d data/raw_data \
              -o data/preprocessed \
              python src/data/make_dataset.py
