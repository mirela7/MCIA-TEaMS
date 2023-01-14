//
// Created by sorana on 1/11/2023.
//
#include <iostream>
#include <fstream>
#include <ctime>
#include <sstream>
#include <iomanip>
#include "../include/RecomSystem.h"

const char* RecomSystem::RecomLogParser::k_pathToLogFile = "../../../../RecomSystem/logs/train_logs.txt";

std::vector<uint16_t> RecomSystem::GetRecommendedMovies(int userId, int batchSize, int numMoviesToRecommend) {

   std::vector<uint16_t> res;

    PyObject* result = PyObject_CallFunction(m_recommendFunction, "iii", userId, batchSize, numMoviesToRecommend);
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

void RecomSystem::UpdateModelByUserReview(int userId, int movieId, float rating) {
    PyObjectWrapper result{PyObject_CallFunction(m_updateValuesForTrainFunction, "iif", userId, movieId, rating)};
    
}

void RecomSystem::RetrainModel()
{
    PyObjectWrapper trainModel{ PyObject_CallNoArgs(m_retrainModel) };
}

bool RecomSystem::HasToRetrain()
{
    return RecomLogParser::toHours(RecomLogParser::getTimeSinceLastTrain()) > k_nmbHoursBetweenTrains;
}

RecomSystem::RecomSystem()
{
    Py_Initialize();

    //surpress tensorflow warnings:
    //PyRun_SimpleString("import os");
    //PyRun_SimpleString("os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'");

    m_moduleName.SetPyObj(PyUnicode_FromString(k_moduleName));
    m_module.SetPyObj(PyImport_Import(m_moduleName));
    m_moduleDict.SetPyObj(PyModule_GetDict(m_module));
    m_recommendFunction.SetPyObj(PyDict_GetItemString(m_moduleDict.GetPyObj(), k_recommendFunctionName));
    m_retrainModel.SetPyObj(PyDict_GetItemString(m_moduleDict.GetPyObj(), k_retrainModelFunctionName));
    m_updateValuesForTrainFunction.SetPyObj(PyDict_GetItemString(m_moduleDict.GetPyObj(), k_updateValuesForTrainFunctionName));

    if(!m_module)
        PyErr_Print();

    if(!m_recommendFunction){
        std::cout<<"Function" << k_recommendFunctionName<<" does not exist!";
    }
    if(!m_updateValuesForTrainFunction){
        std::cout<<"Function " << k_updateValuesForTrainFunctionName << " does not exist!";
    }
    if(!m_retrainModel){
        std::cout<<"Function " << k_retrainModelFunctionName << " does not exist!";
    }

    //Py_Finalize();
}

RecomSystem::~RecomSystem() {
    //Py_Finalize();
}

RecomSystem &RecomSystem::GetInstance() {
    static RecomSystem recomSystem;
    return recomSystem;
}

std::string RecomSystem::RecomLogParser::getLastTrainingDate(char line[])
{
    std::string posInDay; // %H:%M:%S
    std::string posInYear; // %Y-%m-%d

    std::string fullLine(line);
    size_t idxStartPosInDay = fullLine.find_last_of(' ');
    size_t milliseconds = fullLine.find_last_of('.');
    posInDay = fullLine.substr(idxStartPosInDay + 1, milliseconds - idxStartPosInDay - 1);
    size_t idxStartYear = (fullLine.substr(0, idxStartPosInDay)).find_last_of(' ');
    posInYear = fullLine.substr(idxStartYear + 1, idxStartPosInDay - idxStartYear);
    return posInYear + " " + posInDay;
}

int RecomSystem::RecomLogParser::getTimeSinceLastTrain()
{
    std::ifstream f(k_pathToLogFile);
    int timeSinceLastTrain = 0;

    std::tm now{}; // current time
    std::tm lastTrainTM{}; // last train time

    // get last line from log file
    char* buff = new char[200];
    char* lastLine = new char[205];

    while (f.getline(buff, 200)) {
        strcpy_s(lastLine, 200, buff);
    }

    // get last train time
    std::string lastTrainStr = getLastTrainingDate(lastLine);
    std::istringstream ss(lastTrainStr);
    ss >> std::get_time(&lastTrainTM, "%Y-%m-%d %H:%M:%S");

    // get current time
    std::time_t tNow = std::time(0);   // get time now
    now = *std::localtime(&tNow);

    // convert to time since epoch
    std::time_t lastTrainDate = std::mktime(&lastTrainTM);
    std::time_t nowTime = std::mktime(&now);

    // check conversion error
    if (lastTrainDate == -1 || nowTime == -1) {
        std::cout << "Error converting time"; //TODO: ADD EXCEPTION
    }
    else {
        timeSinceLastTrain = std::difftime(nowTime, lastTrainDate);
    }
    return timeSinceLastTrain;
}

double RecomSystem::RecomLogParser::toHours(int epochTime)
{
    return epochTime / 3600.0;
}
