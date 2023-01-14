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

    std::vector<uint16_t> GetRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend);
    void UpdateModelByUserReview(int userId, int movieId, float rating);
    ~RecomSystem();

private:
    RecomSystem();

    PyObjectWrapper m_moduleName; // the module name
    PyObjectWrapper m_module; // the module
    PyObjectWrapper m_moduleDict; // the module dictionary

    PyObjectWrapper m_recommendFunction; // the function from the module : recommend_movies
    PyObjectWrapper m_updateValuesForTrainFunction; // the function that updates the data for train : train_for_user
    PyObjectWrapper m_retrainModel; // the function that retrains the model : retrain_last_values

private:
    
    class RecomLogParser {
    public:
        static std::string getLastTrainingDate(char line[]);
        static int getTimeSinceLastTrain();
        static double toHours(int epochTime);
    private:
        static const char* k_pathToLogFile;
    };


private:
    const char* k_moduleName = "RecomSystemRatingBased"; //TODO: naming ref
    const char* k_recommendFunctionName="recommend_movies";
    const char* k_updateValuesForTrainFunctionName="train_for_user";
    const char* k_updateModelFunctionName="retrain_last_values";
};


#endif //MCIA_RECOMSYSTEM_H
