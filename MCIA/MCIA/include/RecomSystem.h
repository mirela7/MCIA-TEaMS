//
// Created by sorana on 1/11/2023.
//

#ifndef MCIA_RECOMSYSTEM_H
#define MCIA_RECOMSYSTEM_H
//#include <Python.h>
#include "../include/PyObjectWrapper.h"
#include <vector>
#include <cstdint>

class RecomSystem {
public:
    RecomSystem(RecomSystem&) = delete;

    static RecomSystem& GetInstance();

    std::vector<uint16_t> getRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend);
    void updateModelByUserReview(int userId, int movieId, float rating);
    ~RecomSystem();

private:
    RecomSystem();

    PyObjectWrapper m_moduleName; // the module
    PyObjectWrapper m_module; // the module
    PyObjectWrapper m_moduleDict; // the module
    PyObjectWrapper m_recommendFunction; // the function from the module : recommend_movies
    PyObjectWrapper m_updateModelFunction; // the function from the module : recommend_movies

private:
    const char* k_moduleName = "RecomSystemRatingBased"; //TODO: naming ref
    const char* k_recommendFunctionName="recommend_movies";
    const char* k_updateModelFunctionName="train_for_user";
};


#endif //MCIA_RECOMSYSTEM_H
