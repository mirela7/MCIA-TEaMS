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
				auto& st = DatabaseManagement::GetInstance().GetStorage();

				user_id = AuthService::GetConnectedUser().GetId();

				std::cout << "Please enter the id of the movie you want to rate: ";
				//This checks if the id of the movie to add in watched list exists or not)
				while (true)
				{
					std::cin >> smovie_id;
					try
					{
						size_t maximumIdLenght = 5;
						if (smovie_id.size() <= maximumIdLenght)
						{
							movie_id = std::stoi(smovie_id);
							auto search_movies = st.get_all<Movie>(where(c(&Movie::GetId) == movie_id));
							if (!search_movies.size())
							{
								std::cout << "\nInvalid movie id.\n";
								std::cout << "Please enter a valid movie id: ";
							}
							else
								break;
						}
						else
						{
							std::cout << "\nInvalid movie id.\n";
							std::cout << "Please enter a valid movie id: ";
						}
					}
					catch(std::invalid_argument e)
					{
						std::cout << "\nInvalid movie id.\n";
						std::cout << "Please enter a valid movie id: ";
					}
				}

				std::cout << "Please enter the rating between 1 and 5: ";
				//This checks if the rating for the movie to add in watched list table is valid or out of range.
				while (true)
				{
					std::cin >> srating;
					try
					{
						size_t maximumRatingValueLenght = 3;
						if (srating.size() <= maximumRatingValueLenght)
						{
							rating = std::stof(srating);
							if (rating < 1.0f || rating > 5.0f)
							{
								std::cout << "\nOut of range rating.\n";
								std::cout << "Please enter a valid rating value: ";
							}
							else
								break;
						}
						else
						{
							std::cout << "\nOut of range rating.\n";
							std::cout << "Please enter a valid rating value: ";
						}
					}
					catch (std::invalid_argument e)
					{
						std::cout << "\nOut of range rating.\n";
						std::cout << "Please enter a valid rating value: ";
					}
				}

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