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
	

	auto allFilter = c(&User::GetId) >= 0;
	auto usernameContainingUsernmeFilter = like(&User::GetName, "Username%");

	char ch;
	int wantedPage = 0;
	auto result = PagedSelection<User>::select(2, wantedPage, usernameContainingUsernmeFilter);
	std::cout << result;
	std::cout << "Navigate table: ";
	while (std::cin >> ch)
	{
		if (ch == 'b')
			wantedPage = max(wantedPage - 1, 0);
		else if (ch == 'n')
			wantedPage = min(wantedPage + 1, result.nmbPages - 1);
		else return 0;
		auto result = PagedSelection<User>::select(2, wantedPage, allFilter);
		std::cout << result;
		std::cout << "Navigate table: ";
	}
	return 0;
}