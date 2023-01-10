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

	friend std::ostream& operator<<(std::ostream& g, MovieInformationDisplayer mid) {
		std::vector<std::string> propertyRows;
		propertyRows.emplace_back(" Movie id: " + std::to_string(mid.m_movieId));
		propertyRows.emplace_back(" Title: " + mid.m_title);
		propertyRows.emplace_back(" Genres: " + mid.m_genres);

		size_t maxLength = std::max_element(propertyRows.begin(), propertyRows.end(),
			[](const std::string& a, const std::string& b) {
				return a.size() < b.size();
		})->size() + 1;
		g << '\n';
		for (int i = 0; i <= maxLength + 1; ++i)
			g << NamedAsciiChars::DOTTED_BLOCK;
		g << '\n';
		for (const auto& row : propertyRows)
			g << NamedAsciiChars::DOTTED_BLOCK << row << std::setfill(' ') << std::setw(maxLength - row.size() + 1) << NamedAsciiChars::DOTTED_BLOCK << '\n';
		for (int i = 0; i <= maxLength + 1; ++i)
			g << NamedAsciiChars::DOTTED_BLOCK;
		g << "\n\n";
		return g;
	}
private:
	uint32_t m_movieId;
	std::string m_title;
	uint16_t m_releaseYear;
	std::string m_genres;
};