#include "../include/ConsoleInputController.h"

std::pair<int, float> ConsoleInputController::gatherMovieRatingInfo(const std::vector<Movie>& displayedPage) const
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
