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
		std::cout << "Please choose where to go : \n[a] all movies browising  [s] search movie by name [r] rate movie \nEnter option : ";
		std::cin >> ch;
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
				int user_id; 
				std::string smovie_id; int movie_id;
				std::string srating; float rating;
				std::cout << "Please enter the id of the movie you want to rate: "; 
				//TODO: CHECK MOVIE ID IS VALID
				auto& st = DatabaseManagement::GetInstance().GetStorage();
				while (true)
				{
					std::cin >> smovie_id;
					try
					{
						movie_id = std::stoi(smovie_id);
						auto movies = DatabaseManagement::GetInstance().GetStorage().get_all<Movie>(where(c(&Movie::GetId) == movie_id));
						if (!movies.size())
						{
							std::cout << "\nInvalid movie id.\n";
							std::cout << "Please enter a valid movie id: ";
						}
						else
							break;
					}
					catch(std::invalid_argument e)
					{
						std::cout << "Invalid movie id.\n";
						std::cout << "Please enter a valid movie id: ";
					}
				}
				std::cout << "Please enter the rating:";
				//TODO: CHECK RATING IS VALID
				std::cin >> rating;
				// std::cin >> rating; // < this is int atm
				user_id = AuthService::GetConnectedUser().GetId();
				WatchedMovie watchedMovie(user_id, movie_id, rating);// (static_cast<uint16_t>(user_id), static_cast<uint16_t>(movie_id), static_cast<uint8_t>(rating));
				try {
					st.replace(watchedMovie);
				}
				catch (std::exception e) {
					std::cout << e.what();
				}
			}
		}
	}
	
	return 0;
}