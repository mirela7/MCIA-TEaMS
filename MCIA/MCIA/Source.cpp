#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include "DatabaseManagement.h"
#include "AuthService.h"

int main()
{
	auto connectedUser = AuthService::StartAuthProcess();
	std::cout << connectedUser.GetName();
	return 0;
}