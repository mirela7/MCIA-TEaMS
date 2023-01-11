//
// Created by sorana on 1/11/2023.
//

#ifndef MCIA_RECOMSYSTEM_H
#define MCIA_RECOMSYSTEM_H
#include <Python.h>
#include <vector>

class RecomSystem {
public:
    RecomSystem();

    std::vector<int> getRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend);

    ~RecomSystem();
private:
    PyObject *GetModule();
    PyObject *GetFunctionToRun();

private:
    PyObject* m_module; // the module
    PyObject* m_function; // the function from the module : recommend_movies

private:
    const char* k_module_name = "RecomSystemRatingBased"; //TODO: naming ref
    const char* k_function_name="recommend_movies";
};


#endif //MCIA_RECOMSYSTEM_H
