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
#include "include/OperationStatusToMessage.h"
#include "include/OperationStatus.h"
#include <stdlib.h>
//#include <Python.h>

using namespace sqlite_orm;

const int kNmbRows = 10;

/* returns valid { movieId, rating } */
std::pair<int, float> gatherMovieRatingInfo(const std::vector<Movie>& displayedPage)
{
	char ch;
	std::pair<int, float> movieRatingPair;
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
			movieRatingPair.first = std::stoi(inputString);
		}
		catch (std::invalid_argument e) {
			std::cout << "Please enter a valid id: ";
			continue;
		}
		if (!std::any_of(displayedPage.begin(), displayedPage.end(),
			[&](const Movie& movie) { return movie.GetId() == movieRatingPair.first; }))
		{
			std::cout << "This id doesn't appear to be on this page. Are you sure you want to proceed?\n [y]/[n]: "; 
			std::cin >> ch;
			if (ch == 'y' && !validate.IdExists<Movie>(movieRatingPair.first) || ch != 'y') {
				std::cout << "Please enter a valid id: ";
			}
			else break;
			continue;
		}
		break;
	}

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
			wantedPage = std::min(wantedPage + 1, result.nmbPages - 1);
			break;
		case 'j':
			std::cout << "Choose page number: ";
			std::cin >> wantedPage;
			system("CLS");
			wantedPage = std::min(wantedPage, result.nmbPages - 1);
			wantedPage = std::max(wantedPage, 0);
			break;
		case 'r':
			{
				std::pair<int, float> movieIdRating = gatherMovieRatingInfo(result.results);
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
		default:
			return;
		}
		result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
		std::cout << result;
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [r] rate movie\n [w] add to wishlist.\n";
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

	OperationStatusToMessage ostm;
	//std::cout << ostm.GetMessage(OperationStatus::F_BLANK, "username");
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
[x] Log out.\n\
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
		
		case 'r':
			{ // <--- same, this scope shouldn't be done like this
				
				break;
			}
		case 'w':
			{
				int user_id;
				std::string smovie_id; 
				int movie_id;
				auto& st = DatabaseManagement::GetInstance().GetStorage();
				user_id = AuthService::GetConnectedUserId();

				std::cout << "Please enter the id of the movie you want to add in wishlist: ";
				//This checks if the id of the movie to add in watched list exists or not)
				while (true)
				{
					std::cin >> smovie_id;
					if (smovie_id.size() > 9) {
						std::cout << "Please enter a valid id: ";
						continue;
					}
					try {
						movie_id = std::stoi(smovie_id);
					}
					catch (std::invalid_argument e) {
						std::cout << "Please enter a valid id: ";
						continue;
					}
					if (!validate.IdExists<Movie>(movie_id)) {
						std::cout << "Please enter a valid id: ";
						continue;
					}
					break;
				}

				WishList wishlist(user_id, movie_id);
				try {
					st.replace(wishlist);
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
				break;
			}
			
		default:
			std::cout << "Invalid option.\n";
			break;
		}
	}
	
	return 0;
}