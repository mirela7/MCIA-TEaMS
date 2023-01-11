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
#include "include/ConsoleInputController.h"
#include <stdlib.h>
#include <Python.h>

using namespace sqlite_orm;

const int kNmbRows = 10;

template<typename T>
void displayTable(T filter, const ConsoleInputController& consoleInputController) 
{
	auto showInstructions = []() {
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [r] rate movie\n [w] add to wishlist.\n [i] info about movie\n [x] back to menu\n";
		std::cout << "Input character: ";
	};

	char ch;
	int wantedPage = 0;
	auto result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
	MovieService ms;
	std::cout << result;
	showInstructions();
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
				std::pair<int, float> movieIdRating = consoleInputController.gatherMovieRatingInfo(result.GetResults());
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
		case 'i':
			{
				int movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults());
				MovieInformationDisplayer movieInfo = ms.GetMovieInformations(movieId);
				std::cout << movieInfo << '\n';
				showInstructions();
				continue;
			}
			break;
		case 'w':
			{
				int movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults());
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
		case 'x':
			system("CLS");
			return;
		default:
			std::cout << "Input character: ";
			continue;
		}
		result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
		std::cout << result;
		showInstructions();
	}
}

void displayWatchedList(const ConsoleInputController& consoleInputController)
{
	auto showInstructions = [](){
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [i] info about movie\n [x] back to menu\n";
		std::cout << "Input character: ";
	};
	MovieService ms;
	char ch;
	uint32_t connectedUserId = AuthService::GetConnectedUserId();
	int wantedPage = 0;
	auto result = ms.GetWatchedMoviesOfUser(connectedUserId, wantedPage, kNmbRows);
	std::cout << result;
	showInstructions();
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
				int movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults());
				MovieInformationDisplayer movieInfo = ms.GetMovieInformations(movieId);
				std::cout << movieInfo << '\n';
				showInstructions();
				continue;
			}
			break;
		case 'x':
			system("CLS");
			return;
		default:
			std::cout << "Input character: ";
			continue;
		}
		result = ms.GetWatchedMoviesOfUser(connectedUserId, wantedPage, kNmbRows);
		std::cout << result;
		showInstructions();
	}
}

void test_python(){
    int user_id = 1,num_movie_recom=10, batch_size=10;
    double test=0.0;
    PyObject* modname; // the name of the module we want to import : RecomSystemRatingBased
    PyObject* module; // the module
    PyObject* mdict; // the dictionary of the module
    PyObject* function; // the function from the module : recommend_movies
    PyObject* result; // the result of the function : list with id-s of recommended movies

    // init python:
    Py_Initialize();

    modname = PyUnicode_FromString("RecomSystemRatingBased");
    module = PyImport_Import(modname); // equivalent of "import RecomSystemRatingBased"

    // does it exist?
    if(!module){
        PyErr_Print();
    }

    mdict = PyModule_GetDict(module);
    function = PyDict_GetItemString(mdict, "recommend_movies");

    if(!function){
        std::cout<<"Function does not exist!";
    }

    result = PyObject_CallFunction(function, "iii", user_id, batch_size, num_movie_recom);

    std::cout<<"Movies' id recommended for "<<user_id<<": ";
    // is it really a list?
    if (PyList_Check(result)) {
        // okay, it's a list
        for (Py_ssize_t i = 0; i < PyList_Size(result); ++i) {
            PyObject* next = PyList_GetItem(result, i);
            double value = PyFloat_AsDouble(next);
            std::cout<<value<<" ";

        }
    }

    //TODO: DEALLOCATE MEMORY
    Py_Finalize();
}
int main()
{
	test_python();
/*
	char ch;
	bool isSearching = false;
	std::string movieName;
	DBValidation validate;
	ConsoleInputController consoleInputController;
	
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
					displayTable(movieNameFilter, consoleInputController);
				else displayTable(allFilter, consoleInputController);
			}
			break;
		case 'v':
			displayWatchedList(consoleInputController);
			break;
		case 'w':
			/*
			 * wishlist 
			 */
		/*	break;
		case 'x':
			AuthService::LogOut();
			break;
		default:
			std::cout << "Invalid option.\n";
			break;
		}
	}
	*/
	return 0;
}