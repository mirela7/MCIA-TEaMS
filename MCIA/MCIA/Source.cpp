#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include "DatabaseManagement.h"
#include "AuthService.h"
#include "PagedSelection.h"
#include "Filter.h"
#include <functional>

int a()
{
	return 1;
}


int main()
{
	/*auto connectedUser = AuthService::StartAuthProcess();
	std::cout << connectedUser.GetName();
	*/
	

	//std::function<std::string()> str = User::GetName;
	std::function<int(void)> fct = a;
	
	std::string str = "ac";
	auto result = PagedSelection<User>::select( Filter<User>::columnIs(User::GetName, str, 6, 0);

	return 0;
}