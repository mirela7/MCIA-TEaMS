#include <iostream>
#include "DatabaseManagement.h"

int main()
{
	std::cout << "Username:";
	std::string name, pw;

	std::cin >> name;
	auto dbm = DatabaseManagement::GetInstance();
	std::cout << dbm.GetUserByName(name).GetPassword();
	return 0;
}