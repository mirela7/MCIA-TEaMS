#pragma once
#include <iostream>
#include <string>

class Movie
{
public:
	Movie() = default;
	Movie(const int id, const std::string& title, const std::string& genre, const uint16_t releaseYear, const uint16_t duration);
	Movie(const Movie& movie);
	Movie(Movie&& movie) noexcept;

	Movie& operator=(const Movie& movie);
	Movie& operator=(Movie&& movie) noexcept;


private:
	int m_id;
	std::string m_title;
	std::string m_genre;
	uint16_t m_releaseYear;
	uint16_t m_duration;
};