#include "../include/ConsoleInputController.h"

std::pair<int, float> ConsoleInputController::gatherMovieRatingInfo(const std::vector<Movie>& displayedPage, std::ostream& out, std::istream& in) const
{
	char ch = 0;
	std::pair<int, float> movieRatingPair;
	std::string inputString;
	movieRatingPair.first = gatherMovieIdFromUser(displayedPage, out, in);

	out << OUT_PICK_RATING;
	//This checks if the rating for the movie to add in watched list table is valid or out of range.
	while (true)
	{
		in >> inputString;
		try
		{
			size_t maximumRatingValueLength = 3;
			if (inputString.size() <= maximumRatingValueLength)
			{
				movieRatingPair.second = std::stof(inputString);
				if (movieRatingPair.second < 1.0f || movieRatingPair.second > 5.0f)
					out << OUT_RATING_OUT_OF_RANGE;
				else
					break;
			}
			else
				out << OUT_RATING_OUT_OF_RANGE;
		}
		catch (std::invalid_argument e)
		{
			out << OUT_RATING_OUT_OF_RANGE;
		}
	}
	return movieRatingPair;
}
