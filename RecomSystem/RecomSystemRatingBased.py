import heapq
import tensorflow
from NeuralNetwork import retrieve_model
import numpy as np
import csv


def recommend_movies(user_id, batch_size, num_movie_recom):
    # get model
    # TODO: send path as argument
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/train600')

    # the pool of movies from which we recommend
    # TODO: select random movies from available pool
    batch_movies = [x for x in range(batch_size)]

    map_item_scores = {}
    # users needed for predictions
    users = np.full(batch_size, user_id, dtype='int32')
    predictions = model.predict([users, np.array(batch_movies)], verbose=0)

    for x in range(batch_size):
        map_item_scores[x] = predictions[x]

    ranklist = heapq.nlargest(num_movie_recom, map_item_scores, map_item_scores.get)
    return ranklist


def dummy_return_function(a):
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/first_train')
    return [a, a, a]


# function to test import in c++
def test_import_functio():
    print('yay here:)')


def train_for_user(userId, movieId, rating):
    userId += 500  # first 500 users are our "base" value
    with open('../../../../RecomSystem/data/rating_first500.csv', 'a', newline='') as fd:
        writer = csv.writer(fd)
        writer.writerow([userId, movieId, rating])
    model = tensorflow.keras.models.load_model('../../../../RecomSystem/saved_model/train600')
    model.compile(optimizer='adam', loss='mean_absolute_error', metrics=['mean_absolute_percentage_error'])
    model.fit(x=(np.array([userId]), np.array([movieId])), y=np.array([rating]), verbose=0)
    model.save('../../../../RecomSystem/saved_model/train600')
    print('updated model!')
    return 1


if __name__ == '__main__':
    # print(recommend_movies(0))
    # print(recommend_movies(0, 100, 10))
    train_for_user(1, 1, 1)