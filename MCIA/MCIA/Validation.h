#pragma once
#include <string>	
#include <iostream>
#include "OperationStatus.h"
#include "CodedException.h"

class Validation
{
public:
	static OperationStatus IsUsernameValid(const std::string& username);
	static OperationStatus IsPasswordValid(const std::string& password);
	static bool IsAlphaNumericOrSpecial(const std::string& string);
	static bool IsBlank(const std::string& string);
	static bool IsNotBlank(const char c);
public:
	/* WILL BE DELETED */
	static void dummyUserValidation();

private:
	Validation() = default;

	static bool IsNotAlphaNumericOrSpecial(const char c);

private:
	static const int kMinUsernameLength = 3;
	static const int kMinPasswordLength = 3;
};

