#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include "DatabaseManagement.h"

int main()
{
	std::cout << "Username:";
	std::string name, pw;

	std::cin >> name;
	auto dbm = DatabaseManagement::GetInstance();
	//std::cout << dbm.GetUserByName(name).GetPassword();
	std::cout << dbm.GetElementById<User>(1);
	return 0;
}