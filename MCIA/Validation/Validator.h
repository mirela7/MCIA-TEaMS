#pragma once
#ifdef VALIDATION_EXPORT
#define VALIDATION_API _declspec(dllexport)
#else
#define VALIDATION_API _declspec(dllimport)
#endif

class Validator
{
};

