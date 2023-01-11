//
// Created by sorana on 1/11/2023.
//
#include <iostream>
#include "../include/RecomSystem.h"

PyObject *RecomSystem::GetModule() {
    PyObject* modname = PyUnicode_FromString("RecomSystemRatingBased");
    PyObject* module = PyImport_Import(modname);
    //Py_DECREF(modname);
    return module;
}

PyObject *RecomSystem::GetFunctionToRun() {
    PyObject* mdict = PyModule_GetDict(m_module);
    PyObject* function = PyDict_GetItemString(mdict, "recommend_movies");
    return function;
}

std::vector<int> RecomSystem::getRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend) {
    std::vector<int> res;
    Py_Initialize();

    if(!m_module)
        PyErr_Print();

    if(!m_function){
        std::cout<<"Function does not exist!";
    }

    PyObject* result = PyObject_CallFunction(m_function, "iii", userId, batchSize, numMoviesToRecommend);
    if(PyList_Check(result)){
        // okay, it's a list
        for (Py_ssize_t i = 0; i < PyList_Size(result); ++i) {
            PyObject* next = PyList_GetItem(result, i);
            double value = PyFloat_AsDouble(next);
            res.push_back(value);
        }
    }
    //Py_DECREF(result);

    return std::move(res);
}

RecomSystem::RecomSystem()
{
    Py_Initialize();
    m_module = GetModule();
    m_function = GetFunctionToRun();

}

RecomSystem::~RecomSystem() {
    Py_Finalize();
    //Py_DECREF(module);
    //Py_DECREF(mdict);
}
