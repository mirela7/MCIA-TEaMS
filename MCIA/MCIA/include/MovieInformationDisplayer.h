#pragma once
#include <iostream>
#include <iomanip>
#include <cstdint>
#include <string>
#include <vector>
#include <algorithm>
#include "NamedAsciiChars.h"
class MovieInformationDisplayer
{
public:
	MovieInformationDisplayer(uint32_t id, const std::string& title, const uint16_t releaseYear, const std::string genres = "");
	
	void addGenre(const std::string& genre);

	friend std::ostream& operator<<(std::ostream& g, MovieInformationDisplayer mid);
private:
	uint32_t m_movieId;
	std::string m_title;
	uint16_t m_releaseYear;
	std::string m_genres;
};
