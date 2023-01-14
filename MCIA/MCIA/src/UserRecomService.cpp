//
// Created by sorana on 1/14/2023.
//
#include "../include/UserRecomService.h"
#include "../include/RecomSystem.h"
#include <iostream>

void UserRecomService::StartPopulatingRecommendedMovies() {
    /*auto getRecommendedMoviesTask = [&]() {
        std::lock_guard<std::mutex> lockGuard{ m_mutexUpdateMovies };
        //std::this_thread::sleep_for(std::chrono::seconds(5));
        std::cout<<"recom"<<std::this_thread::get_id()<<"\n";
        return RecomSystem::GetInstance().GetRecommendedMovies(m_currentUserId, 100, 10);
    };
    m_recommendedMoviesFuture = std::async(std::launch::async, getRecommendedMoviesTask);*/
}


std::vector<uint16_t> UserRecomService::GetRecommendedMovies() {
    //either return the result, or wait for the thread to finish
    //if(m_recommendedMovies.empty())
    m_recommendedMovies = RecomSystem::GetInstance().GetRecommendedMovies(m_currentUserId, 100, 10);
    return m_recommendedMovies;
}

UserRecomService::UserRecomService(uint32_t userId) : m_currentUserId(userId) {}

void UserRecomService::StartUpdatingMovie(const uint32_t movieId, const float rating) {
    /*auto updateRecommendedMoviesTask = [=]() {
        std::lock_guard<std::mutex> lockGuard{m_mutexUpdateMovies};
        std::cout<<"starting to update "<<std::this_thread::get_id()<<"\n";
        RecomSystem::GetInstance().UpdateModelByUserReview(m_currentUserId, movieId, rating);
        std::cout<<"finished updating "<<std::this_thread::get_id()<<"\n";
    };
    std::thread updateThread{updateRecommendedMoviesTask};
    updateThread.detach();*/

    RecomSystem::GetInstance().UpdateModelByUserReview(m_currentUserId, movieId, rating);
    if (RecomSystem::GetInstance().HasToRetrain()) {
        RetrainModel();
    }
    else {
        std::cout << "No need to retrain";
    }
}

void UserRecomService::RetrainModel()
{
    /*auto retrainModel = [&]() {
        std::lock_guard<std::mutex> lockGuard{ m_mutexUpdateMovies };
        std::cout << "starting to retrain " << std::this_thread::get_id() << "\n";
        RecomSystem::GetInstance().RetrainModel();
        std::cout << "finished retraining " << std::this_thread::get_id() << "\n";
    };
    std::thread retrainThread{ retrainModel };
    retrainThread.detach();*/
    RecomSystem::GetInstance().RetrainModel();
}
