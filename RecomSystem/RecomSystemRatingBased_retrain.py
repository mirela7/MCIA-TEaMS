import csv
import tensorflow
from tensorflow.python.keras.models import model_from_json
from datetime import datetime
import numpy as np


def retrain_last_values():
    tensorflow.keras.backend.clear_session()
    print('IMPORTING MODEL FOR RETRAIN MODEL==================')
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/train600')
    print("Loaded model from disk")
    model.compile(optimizer='adam', loss='mean_absolute_error', metrics=['mean_absolute_percentage_error'])
    print('RETRAIN MODEL LOADED===============================')

    train_file = open('../../../../RecomSystem/data/new_data.csv')
    csvreader = csv.reader(train_file)
    userIds = []
    movieIds = []
    ratings = []
    header = next(csvreader)
    for row in csvreader:
        userIds.append(int(row[0]))
        movieIds.append(int(row[1]))
        ratings.append(float(row[2]))
    train_file.close()

    # with open('../../../../RecomSystem/logs/train_logs.txt', 'a') as file:
    #     file.write('Loading model started %s.' % datetime.now())
    with open('../../../../RecomSystem/logs/train_logs.txt', 'a') as file:
        file.write('Train started %s' % datetime.now())
    print('TRAIN STARTED:')
    model.fit(x=(np.array(userIds), np.array(movieIds)), y=np.array(ratings), verbose=1)
    print('trained complete model. start saving')
    model.save('../../../../RecomSystem/saved_model/train600')
    # TODO: FORCE COPY OVER INITIAL FOLDER
    print('model saved. saving in logs')

    with open('../../../../RecomSystem/logs/train_logs.txt', 'a') as file:
        file.write(' and ended %s\n' % datetime.now())
    tensorflow.keras.backend.clear_session()
    return 1

retrain_last_values()