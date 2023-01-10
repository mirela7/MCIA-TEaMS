#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include <sqlite_orm/sqlite_orm.h>
#include "include/DatabaseManagement.h"
#include "include/AuthService.h"
#include "include/DBPage.h"
#include "include/Movie.h"
#include "include/DBValidation.h"
#include "include/WishList.h"
#include "include/OperationStatus.h"
#include "include/MovieService.h"
#include <stdlib.h>
//#include <Python.h>

using namespace sqlite_orm;

const int kNmbRows = 10;

template<class T>
int gatherMovieIdFromUser(const std::vector<T>& displayedPage)
{
	char ch;
	int movieId;
	DBValidation validate;
	std::string inputString;

	std::cout << "Please enter the id of the movie you want to rate: ";
	//This checks if the id of the movie to add in watched list exists or not)
	while (true)
	{
		std::cin >> inputString;
		if (inputString.size() > 9) {
			std::cout << "Please enter a valid id: ";
			continue;
		}
		try {
			movieId = std::stoi(inputString);
		}
		catch (std::invalid_argument e) {
			std::cout << "Please enter a valid id: ";
			continue;
		}
		if (!std::any_of(displayedPage.begin(), displayedPage.end(),
			[&movieId](const T& movie) { return movie.GetMovieId() == movieId; }))
		{
			std::cout << "This id doesn't appear to be on this page. Are you sure you want to proceed?\n [y]/[n]: ";
			std::cin >> ch;
			if (ch == 'y' && !validate.IdExists<Movie>(movieId) || ch != 'y') {
				std::cout << "Please enter a valid id: ";
			}
			else break;
			continue;
		}
		break;
	}
	return movieId;
}

int gatherMovieIdFromUser(const std::vector<Movie>& displayedPage)
{
	char ch;
	int movieId;
	DBValidation validate;
	std::string inputString;

	std::cout << "Please enter the id of the movie you want to pick: ";
	//This checks if the id of the movie to pick exists or not)
	while (true)
	{
		std::cin >> inputString;
		if (inputString.size() > 9) {
			std::cout << "Please enter a valid id: ";
			continue;
		}
		try {
			movieId = std::stoi(inputString);
		}
		catch (std::invalid_argument e) {
			std::cout << "Please enter a valid id: ";
			continue;
		}
		if (!std::any_of(displayedPage.begin(), displayedPage.end(),
			[&](const Movie& movie) { return movie.GetId() == movieId; }))
		{
			std::cout << "This id doesn't appear to be on this page. Are you sure you want to proceed?\n [y]/[n]: ";
			std::cin >> ch;
			if (ch == 'y' && !validate.IdExists<Movie>(movieId) || ch != 'y') {
				std::cout << "Please enter a valid id: ";
			}
			else break;
			continue;
		}
		break;
	}
	return movieId;
}

/* returns valid { movieId, rating } */
std::pair<int, float> gatherMovieRatingInfo(const std::vector<Movie>& displayedPage)
{
	char ch = 0;
	std::pair<int, float> movieRatingPair;
	std::string inputString;
	movieRatingPair.first = gatherMovieIdFromUser(displayedPage);

	std::cout << "Please enter the rating between 1 and 5: ";
	//This checks if the rating for the movie to add in watched list table is valid or out of range.
	while (true)
	{
		std::cin >> inputString;
		try
		{
			size_t maximumRatingValueLenght = 3;
			if (inputString.size() <= maximumRatingValueLenght)
			{
				movieRatingPair.second = std::stof(inputString);
				if (movieRatingPair.second < 1.0f || movieRatingPair.second > 5.0f)
				{
					std::cout << "Out of range rating.\n";
					std::cout << "Please enter a valid rating value: ";
				}
				else
					break;
			}
			else
			{
				std::cout << "Out of range rating.\n";
				std::cout << "Please enter a valid rating value: ";
			}
		}
		catch (std::invalid_argument e)
		{
			std::cout << "Out of range rating.\n";
			std::cout << "Please enter a valid rating value: ";
		}
	}
	system("CLS");
	return movieRatingPair;
}

template<typename T>
void displayTable(T filter) 
{
	char ch;
	int wantedPage = 0;
	auto result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
	std::cout << result;
	std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [r] rate movie\n [w] add to wishlist.\n";
	std::cout << "Input character: "; 
	while (std::cin >> ch)
	{
		switch (ch)
		{
		case 'b':
			system("CLS");
			wantedPage = std::max(wantedPage - 1, 0);
			break;
		case 'n':
			system("CLS");
			wantedPage = std::min(wantedPage + 1, result.GetNmbPages() - 1);
			break;
		case 'j':
			std::cout << "Choose page number: ";
			std::cin >> wantedPage;
			system("CLS");
			wantedPage = std::min(wantedPage, result.GetNmbPages() - 1);
			wantedPage = std::max(wantedPage, 0);
			break;
		case 'r':
			{
				std::pair<int, float> movieIdRating = gatherMovieRatingInfo(result.GetResults());
				WatchedMovie watchedMovie(AuthService::GetConnectedUserId(), movieIdRating.first, movieIdRating.second);
				try {
					DatabaseManagement::GetInstance().GetStorage().replace(watchedMovie);
					std::cout << "Movie rating saved.\n";
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
			}
			break;
		case 'w':
			{
				int movieId = gatherMovieIdFromUser(result.GetResults());
				WishList wishlist(AuthService::GetConnectedUserId(), movieId);
				try {
					DatabaseManagement::GetInstance().GetStorage().replace(wishlist);
					system("CLS");
					std::cout << "Movie added to watchlist.\n";
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
			}
			break;
		default:
			system("CLS");
			return;
		}
		result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
		std::cout << result;
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [r] rate movie\n [w] add to wishlist.\n";
		std::cout << "Input character: ";
	}
}

void displayWatchedList()
{
	MovieService ms;
	char ch;
	uint32_t connectedUserId = AuthService::GetConnectedUserId();
	int wantedPage = 0;
	auto result = ms.GetWatchedMoviesOfUser(connectedUserId, wantedPage, kNmbRows);
	std::cout << result;
	std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [i] info about movie\n";
	std::cout << "Input character: ";
	while (std::cin >> ch)
	{
		switch (ch)
		{
		case 'b':
			system("CLS");
			wantedPage = std::max(wantedPage - 1, 0);
			break;
		case 'n':
			system("CLS");
			wantedPage = std::min(wantedPage + 1, result.GetNmbPages() - 1);
			break;
		case 'j':
			std::cout << "Choose page number: ";
			std::cin >> wantedPage;
			system("CLS");
			wantedPage = std::min(wantedPage, result.GetNmbPages() - 1);
			wantedPage = std::max(wantedPage, 0);
			break;
		case 'i':
			{
				int movieId = gatherMovieIdFromUser(result.GetResults());
			}
			break;
		default:
			return;
		}
		result = ms.GetWatchedMoviesOfUser(connectedUserId, wantedPage, kNmbRows);
		std::cout << result;
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [i] info about movie\n";
		std::cout << "Input character: ";
	}
}

int main()
{
	/*Py_Initialize();
	PyRun_SimpleString("import os");
	PyRun_SimpleString("print(\"PYTHONPATH:\", os.environ.get('PYTHONPATH'))");
    PyRun_SimpleString("import data_import");
    PyRun_SimpleString("data_import.test_function()");
	PyRun_SimpleString("print('Hello din acest fisier')");

	Py_Finalize();*/

	char ch;
	bool isSearching = false;
	std::string movieName;
	DBValidation validate;
	
	AuthService::StartAuthProcess();
	system("CLS");
	std::cout << "Welcome, " << AuthService::GetConnectedUserName() << "!\n\n";
	while (true)
	{
		std::cout << "Please choose what to do : \n \
[a] all movies browising\n \
[s] search movie by name\n \
[v] my watched list\n \
[w] my wishlist\n \
[r] recommend me something\n \
[x] log out.\n\
Enter an option: ";
		std::cin >> ch;
		system("CLS");
		switch (ch) {
		case 'a':
		case 's':
			{ //<-- temporary solution, this scope should be removed
				if (ch == 'a') {
					isSearching = false;
				}
				else {
					isSearching = true;
					std::cout << "Please enter a movie name: ";
					std::cin >> movieName;
					system("CLS");
				}
				std::string query = "%" + movieName + "%";
				auto allFilter = c(&Movie::GetId) >= 0;
				auto movieNameFilter = like(&Movie::GetTitle, query);

				if (isSearching)
					displayTable(movieNameFilter);
				else displayTable(allFilter);
			}
			break;
		case 'v':
			displayWatchedList();
			break;
		case 'w':
			/*
			 * wishlist 
			 */
			break;
		case 'x':
			AuthService::LogOut();
			break;
		default:
			std::cout << "Invalid option.\n";
			break;
		}
	}
	
	return 0;
}