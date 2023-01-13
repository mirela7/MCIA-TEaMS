//
// Created by sorana on 1/11/2023.
//
#include <iostream>
#include "../include/RecomSystem.h"

std::vector<int> RecomSystem::getRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend) {
    std::vector<int> res;

    PyObjectWrapper result{PyObject_CallFunction(m_recommendFunction, "iii", userId, batchSize, numMoviesToRecommend)};
    if(PyList_Check(result)){
        // okay, it's a list
        for (Py_ssize_t i = 0; i < PyList_Size(result); ++i) {
            PyObjectWrapper next{PyList_GetItem(result, i)};
            double value = PyFloat_AsDouble(next);
            res.push_back(value);
        }
    }

    return res;
}

void RecomSystem::updateModelByUserReview(int userId, int movieId, float rating) {
    PyObjectWrapper result{PyObject_CallFunction(m_updateModelFunction, "iif", userId, movieId, rating)};
}

RecomSystem::RecomSystem()
{
    Py_Initialize();

    //surpress tensorflow warnings:
    PyRun_SimpleString("import os");
    PyRun_SimpleString("os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'");

    m_moduleName.SetPyObj(PyUnicode_FromString(k_moduleName));
    m_module.SetPyObj(PyImport_Import(m_moduleName));
    m_moduleDict.SetPyObj(PyModule_GetDict(m_module));
    m_recommendFunction.SetPyObj(PyDict_GetItemString(m_moduleDict.GetPyObj(), k_recommendFunctionName));
    m_updateModelFunction.SetPyObj(PyDict_GetItemString(m_moduleDict.GetPyObj(), k_updateModelFunctionName));

    if(!m_module)
        PyErr_Print();

    if(!m_recommendFunction){
        std::cout<<"Function does not exist!";
    }
    if(!m_updateModelFunction){
        std::cout<<"Function does not exist!";
    }
}

RecomSystem::~RecomSystem() {
    Py_Finalize();
}
