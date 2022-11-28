#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include <sqlite_orm/sqlite_orm.h>
#include "DatabaseManagement.h"
#include "AuthService.h"
#include "DBPage.h"
#include "Movie.h"

using namespace sqlite_orm;

const int kNmbRows = 10;

template<typename T>
void displayTable(T filter) 
{
	char ch;
	int wantedPage = 0;
	auto result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
	std::cout << result;
	std::cout << "Navigate table: ";
	while (std::cin >> ch)
	{
		if (ch == 'b')
			wantedPage = std::max(wantedPage - 1, 0);
		else if (ch == 'n')
			wantedPage = std::min(wantedPage + 1, result.nmbPages - 1);
		else return;
		auto result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
		std::cout << result;
		std::cout << "Navigate table: ";
	}
}


int main()
{
	char ch;
	bool isSearching = false;
	std::string movieName;
	
	auto connectedUser = AuthService::StartAuthProcess();
	std::cout << "Now logged in.";
	while (true)
	{
		std::cout << "Please choose where to go : \n[a] all movies browising  [s] search movie by name\nEnter option : ";
		std::cin >> ch;
		if (ch == 'a') {
			isSearching = false;
		}
		else {
			isSearching = true;
			std::cout << "Please enter a movie name: ";
			std::cin >> movieName;
		}
		std::string query = "%" + movieName + "%";
		auto allFilter = c(&Movie::GetId) >= 0;
		auto movieNameFilter = like(&Movie::GetTitle, query);

		if (isSearching)
			displayTable(movieNameFilter);
		else displayTable(allFilter);
	}
	
	return 0;
}