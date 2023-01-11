import heapq

from NeuralNetwork import retrieve_model
import numpy as np


def recommend_movies(user_id, num_movie_recom, batch_size):
    # get model
    model = retrieve_model('')

    # the pool of movies from which we recommend
    # TODO: select random movies from available pool
    batch_movies = [x for x in range(batch_size)]

    map_item_scores = {}
    # users needed for predictions
    users = np.full(batch_size, user_id, dtype='int32')
    predictions = model.predict([users, np.array(batch_movies)], batch_size=100, verbose=1)

    for x in range(batch_size):
        map_item_scores[x] = predictions[x]

    ranklist = heapq.nlargest(num_movie_recom, map_item_scores, map_item_scores.get)
    return ranklist


# function to test import in c++
def test_import_functio():
    print('yay here:)')


if __name__ == '__main__':
    print(recommend_movies(0, 10, 10))
