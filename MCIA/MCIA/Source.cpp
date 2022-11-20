#include <iostream>
#include "DatabaseManagement.h"
#include "AuthService.h"

int main()
{
	auto connectedUser = AuthService::StartAuthProcess();
	std::cout << connectedUser.GetName();
	return 0;
}