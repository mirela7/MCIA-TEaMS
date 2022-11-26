#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include "DatabaseManagement.h"
#include "AuthService.h"
#include "PagedSelection.h"
#include "Filter.h"
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;


int main()
{
	/*auto connectedUser = AuthService::StartAuthProcess();
	std::cout << connectedUser.GetName();
	*/
	auto result = PagedSelection<User>::select(6, 0, c(&User::GetName) == "Sorana" and c(&User::GetId) < 1);
	std::cout << "No err?";
	return 0;
}