//
// Created by sorana on 1/11/2023.
//

#ifndef MCIA_RECOMSYSTEM_H
#define MCIA_RECOMSYSTEM_H
//#include <Python.h>
#include "../include/PyObjectWrapper.h"
#include <vector>

class RecomSystem {
public:
    RecomSystem();

    std::vector<int> getRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend);

    ~RecomSystem();

private:
    PyObjectWrapper m_moduleName; // the module
    PyObjectWrapper m_module; // the module
    PyObjectWrapper m_moduleDict; // the module
    PyObjectWrapper m_function; // the function from the module : recommend_movies

private:
    const char* k_module_name = "RecomSystemRatingBased"; //TODO: naming ref
    const char* k_function_name="recommend_movies";
};


#endif //MCIA_RECOMSYSTEM_H
