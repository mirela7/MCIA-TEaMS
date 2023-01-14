//
// Created by sorana on 1/14/2023.
//

#ifndef MCIA_USERRECOMSERVICE_H
#define MCIA_USERRECOMSERVICE_H
#include <future>
#include <vector>
class UserRecomService {
protected:
public:
    UserRecomService(uint32_t userId);

public:
    std::vector<uint16_t> GetRecommendedMovies();
    void StartPopulatingRecommendedMovies();
    void StartUpdatingMovie(const uint32_t movieId, const float rating);
    void RetrainModel();

private:
    uint32_t m_currentUserId;

    std::future<std::vector<uint16_t>> m_recommendedMoviesFuture;
    std::vector<uint16_t> m_recommendedMovies;

    std::mutex m_mutexUpdateMovies;
};


#endif //MCIA_USERRECOMSERVICE_H
