#pragma once
#include <string>	
#include "ValidationCode.h"

class Validation
{
public:
	static ValidationCode IsUsernameValid(const std::string& username);
	static ValidationCode IsPasswordValid(const std::string& password);
	static bool IsAlphaNumericOrSpecial(const std::string& string);
	static bool IsBlank(const std::string& string);
	static bool IsNotBlank(const char c);

private:
	Validation() = default;

	static bool IsNotAlphaNumericOrSpecial(const char c);

private:
	static const int kMinUsernameLength = 3;
	static const int kMinPasswordLength = 3;
};

