#pragma once
#include <string>
#ifdef VALIDATION_EXPORTS
#define VALIDATION_API _declspec(dllexport)
#else
#define VALIDATION_API _declspec(dllimport)
#endif

class Validator
{
public:
	bool IsAlphaNumericOrSpecial(const std::string& string);
	bool IsBlank(const std::string& string);
	bool IsNotBlank(const char c);
	bool IsNotAlphaNumericOrSpecial(const char c);
};

