#pragma once

#include <vector>
#include <stdlib.h>
#include "Movie.h"
#include "DBValidation.h"

class ConsoleInputController {
public:

	template<class T>
	int gatherMovieIdFromUser(const std::vector<T>& displayedPage) const;
	
	std::pair<int, float> gatherMovieRatingInfo(const std::vector<Movie>& displayedPage) const;
};

template<>
inline int ConsoleInputController::gatherMovieIdFromUser(const std::vector<Movie>& displayedPage) const
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

template<class T>
int ConsoleInputController::gatherMovieIdFromUser(const std::vector<T>& displayedPage) const
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
