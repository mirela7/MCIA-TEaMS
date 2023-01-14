import heapq
import tensorflow
from keras import backend as K
from NeuralNetwork import retrieve_model
import numpy as np
from datetime import datetime
import csv


def recommend_movies(user_id, batch_size, num_movie_recom):
    tensorflow.keras.backend.clear_session()
    print('cleared session')

    # get model
    # TODO: send path as argument
    print('loading')
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/train600')
    print('loaded. compiling')
    model.compile(optimizer='adam', loss='mean_absolute_error', metrics=['mean_absolute_percentage_error'])
    print('loaded')
    # the pool of movies from which we recommend
    # TODO: select random movies from available pool
    batch_movies = [x for x in range(batch_size)]

    map_item_scores = {}
    # users needed for predictions
    users = np.full(batch_size, user_id, dtype='int32')
    predictions = model.predict([users, np.array(batch_movies)], verbose=0)
    print('clearing session')
    K.clear_session()
    print('cleared session')
    for x in range(batch_size):
        map_item_scores[x] = predictions[x]

    ranklist = heapq.nlargest(num_movie_recom, map_item_scores, map_item_scores.get)
    tensorflow.keras.backend.clear_session()
    return ranklist


def dummy_return_function(a):
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/first_train')
    return [a, a, a]


# function to test import in c++
def test_import_functio():
    print('yay here:)')


def train_for_user(userId, movieId, rating):
    userId += 500  # first 500 users are our "base" value
    with open('../../../../RecomSystem/data/new_data.csv', 'a', newline='') as fd:
        writer = csv.writer(fd)
        writer.writerow([userId, movieId, round(rating, 1)])
    return 1


def retrain_last_values():
    tensorflow.keras.backend.clear_session()
    print('cleared session')
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
    print('loading model')
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/train600', compile=False)
    print('loaded model')
    model.compile(optimizer='adam', loss='mean_absolute_error', metrics=['mean_absolute_percentage_error'])
    print('compiled model. started training')

    with open('../../../../RecomSystem/logs/train_logs.txt', 'a') as file:
        file.write('Train started %s' % datetime.now())
    model.fit(x=(np.array(userIds), np.array(movieIds)), y=np.array(ratings), verbose=1)
    print('trained complete model. start saving')
    model.save('../../../../RecomSystem/saved_model/train600_saved')
    # TODO: FORCE COPY OVER INITIAL FOLDER
    print('model saved. saving in logs')

    with open('../../../../RecomSystem/logs/train_logs.txt', 'a') as file:
        file.write(' and ended %s\n' % datetime.now())
    tensorflow.keras.backend.clear_session()


if __name__ == '__main__':
    # print(recommend_movies(0))
    # print(recommend_movies(0, 100, 10))
    retrain_last_values()
