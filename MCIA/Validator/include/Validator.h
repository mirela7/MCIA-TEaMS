#pragma once
#include <string>
#ifdef VALIDATION_EXPORTS
#define VALIDATION_API __declspec(dllexport)
#else
#define VALIDATION_API __declspec(dllimport)
#endif

class VALIDATION_API Validator
{
public:
	bool IsAlphaNumericOrSpecial(const std::string& string);
	bool IsBlank(const std::string& string);
	bool IsNotBlank(const char c);
	bool IsNotAlphaNumericOrSpecial(const char c);
};

