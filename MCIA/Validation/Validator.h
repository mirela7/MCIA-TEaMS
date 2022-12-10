#pragma once
#include <string>
#ifdef VALIDATION_EXPORT
#define VALIDATION_API _declspec(dllexport)
#else
#define VALIDATION_API _declspec(dllimport)
#endif

class Validator
{
public:
	static bool IsAlphaNumericOrSpecial(const std::string& string);
	static bool IsBlank(const std::string& string);
	static bool IsNotBlank(const char c);
	static bool IsNotAlphaNumericOrSpecial(const char c);
};

