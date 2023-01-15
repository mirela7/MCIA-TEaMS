#define _SILENCE_ALL_CXX17_DEPRECATION_WARNINGS
#pragma warning(disable : 4996)
#include <iostream>
#include <sqlite_orm/sqlite_orm.h>
#include "include/DatabaseManagement.h"
#include "include/AuthService.h"
#include "include/DBPage.h"
#include "include/Movie.h"
#include "include/DBValidation.h"
#include "include/WishlistedMovie.h"
#include "include/OperationStatus.h"
#include "include/MovieService.h"
#include "include/ConsoleInputController.h"
#include "include/RecomSystem.h"
#include <cstdlib>
#include <thread>
#include <future>
#include <cstdlib>
#include <Python.h>

using namespace sqlite_orm;

const int kNmbRows = 10;

template<typename T>
void displayTable(T filter, const ConsoleInputController& consoleInputController) 
{
	auto showInstructions = []() {
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [r] rate movie (add to watchedlist)\n [w] add to wishlist\n [i] info about movie\n [x] back to menu\n";
		std::cout << "Input character: ";
	};

	char ch;
	int wantedPage = 0;
	auto result = DatabaseManagement::GetInstance().PagedSelect<Movie>(wantedPage, kNmbRows, filter);
	uint16_t connectedUserId = AuthService::GetConnectedUserId();
	MovieService ms;
	std::cout << result;
	showInstructions();
	while (std::cin >> ch)
	{
		switch (ch)
		{
		case 'b':
			//system("CLS");
			wantedPage = std::max(wantedPage - 1, 0);
			break;
		case 'n':
			//system("CLS");
			wantedPage = std::min(wantedPage + 1, result.GetNmbPages() - 1);
			break;
		case 'j':
			std::cout << "Choose page number: ";
			std::cin >> wantedPage;
			//system("CLS");
			wantedPage = std::min(wantedPage, result.GetNmbPages() - 1);
			wantedPage = std::max(wantedPage, 0);
			break;
		case 'r':
			{
				std::pair<int, float> movieIdRating = consoleInputController.gatherMovieRatingInfo(result.GetResults());
				//system("CLS");
				try {
					ms.AddMovieToWatchlist(connectedUserId, movieIdRating.first, movieIdRating.second);
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
				try {
					ms.AddMovieToWishlist(connectedUserId, movieId);
					//system("CLS");
					std::cout << "Movie added to wishlist.\n";
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
			}
			break;
		case 'x':
			//system("CLS");
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
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [d] remove movie from watchedlist\n [i] info about movie\n [x] back to menu\n";
		std::cout << "Input character: ";
	};
	MovieService ms;
	char ch;
	uint16_t connectedUserId = AuthService::GetConnectedUserId();
	int wantedPage = 0;
	auto result = ms.GetWatchedMoviesOfUser(connectedUserId, wantedPage, kNmbRows);
	std::cout << result;
	showInstructions();
	while (std::cin >> ch)
	{
		switch (ch)
		{
		case 'b':
			//system("CLS");
			wantedPage = std::max(wantedPage - 1, 0);
			break;
		case 'n':
			//system("CLS");
			wantedPage = std::min(wantedPage + 1, result.GetNmbPages() - 1);
			break;
		case 'j':
			std::cout << "Choose page number: ";
			std::cin >> wantedPage;
			//system("CLS");
			wantedPage = std::min(wantedPage, result.GetNmbPages() - 1);
			wantedPage = std::max(wantedPage, 0);
			break;
		case 'd':
			{
				uint32_t movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults(), false);
				try {
					ms.RemoveMovieFromWatchlist(connectedUserId, movieId);
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
				//system("CLS");
			}
			break;
		case 'i':
			{
				uint32_t movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults(), false);
				MovieInformationDisplayer movieInfo = ms.GetMovieInformations(movieId);
				std::cout << movieInfo << '\n';
				showInstructions();
				continue;
			}
			break;
		case 'x':
			//system("CLS");
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

void displayWishList(const ConsoleInputController& consoleInputController)
{
	auto showInstructions = []() {
		std::cout << "Navigate table using [b] (back), [n] (next), [j] (jump to page).\nOther options:\n [d] remove movie from wishlist\n [i] info about movie\n [r] rate movie\n [x] back to menu\n";
		std::cout << "Input character: ";
	};
	MovieService ms;
	char ch;
	uint16_t connectedUserId = AuthService::GetConnectedUserId();
	int wantedPage = 0;
	auto result = ms.GetWishListOfUser(connectedUserId, wantedPage, kNmbRows);
	std::cout << result;
	showInstructions();
	while (std::cin >> ch)
	{
		switch (ch)
		{
		case 'b':
			//system("CLS");
			wantedPage = std::max(wantedPage - 1, 0);
			break;
		case 'n':
			//system("CLS");
			wantedPage = std::min(wantedPage + 1, result.GetNmbPages() - 1);
			break;
		case 'j':
			std::cout << "Choose page number: ";
			std::cin >> wantedPage;
			//system("CLS");
			wantedPage = std::min(wantedPage, result.GetNmbPages() - 1);
			wantedPage = std::max(wantedPage, 0);
			break;
		case 'd':
			{
				uint32_t movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults(), false);
				try {
					ms.RemoveMovieFromWishlist(connectedUserId, movieId);
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
				//system("CLS");
			}
			break;
		case 'i':
			{
				int movieId = consoleInputController.gatherMovieIdFromUser(result.GetResults(), false);
				MovieInformationDisplayer movieInfo = ms.GetMovieInformations(movieId);
				std::cout << movieInfo << '\n';
				showInstructions();
				continue;
			}
			break;
		case 'r':
		{
			std::pair<int, float> movieIdRating = consoleInputController.gatherMovieRatingInfo(result.GetResults(), false);
			try {
				ms.MoveMovieFromWishlistToWatched(connectedUserId, movieIdRating.first, movieIdRating.second);
				//system("CLS");
				std::cout << "Movie rating saved.\n";
			}
			catch (std::exception e) {
				std::cout << e.what();
			}
		}
		break;
		case 'x':
			//system("CLS");
			return;
		default:
			std::cout << "Input character: ";
			continue;
		}
		result = ms.GetWishListOfUser(connectedUserId, wantedPage, kNmbRows);
		std::cout << result;
		showInstructions();
	}
}

void recommendToUser()
{
	MovieService ms;
	std::vector<uint32_t> mvIdsTest{ 1, 5, 10, 20 };
	auto page = ms.GetMovieListFromListOfIndices(mvIdsTest, 1);
	std::cout << page;
}


int main()
{
	
    std::cout<<"source"<<std::this_thread::get_id()<<"\n";
	char ch;
	bool isSearching = false;
	std::string movieName;
	DBValidation validate;
	ConsoleInputController consoleInputController;
	AuthService authService;
	authService.StartAuthProcess();
	//system("CLS");
	std::cout << "Welcome, " << AuthService::GetConnectedUserName() << "!\n\n";

	while (true)
	{
		std::cout << "Please choose what to do : \n \
[a] all movies browsing\n \
[s] search movie by name\n \
[v] my watched list\n \
[w] my wishlist\n \
[r] recommend me something\n \
[x] log out.\n\
Enter an option: ";
		std::cin >> ch;
		//system("CLS");
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
					//system("CLS");
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
			displayWishList(consoleInputController);
			break;
		case 'x':
			authService.LogOut();
			break;
        case 'r': {

            auto moviesId = AuthService::GetRecommendedMoviesForCurrentUser();
            std::cout << "[" << " ";
            for (auto &id: moviesId)
                std::cout << id << " ";
            std::cout << "]" << " ";
            break;
        }
		default:
			std::cout << "Invalid option.\n";
			break;
		}
	}
	
	return 0;
}