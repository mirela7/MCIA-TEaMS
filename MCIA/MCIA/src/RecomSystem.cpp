//
// Created by sorana on 1/11/2023.
//
#include <iostream>
#include "../include/RecomSystem.h"

std::vector<int> RecomSystem::getRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend) {
    std::vector<int> res;
    Py_Initialize();

    if(!m_module)
        PyErr_Print();

    if(!m_function){
        std::cout<<"Function does not exist!";
    }

    PyObjectWrapper result{PyObject_CallFunction(m_function, "iii", userId, batchSize, numMoviesToRecommend)};
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

RecomSystem::RecomSystem()
{
    Py_Initialize();

    //surpress tensorflow warnings:
    PyRun_SimpleString("import os");
    PyRun_SimpleString("os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'");

    m_moduleName.SetPyObj(PyUnicode_FromString(k_module_name));
    m_module.SetPyObj(PyImport_Import(m_moduleName));
    m_moduleDict.SetPyObj(PyModule_GetDict(m_module));
    m_function.SetPyObj(PyDict_GetItemString(m_moduleDict.GetPyObj(), k_function_name));

}

RecomSystem::~RecomSystem() {
    Py_Finalize();
}
