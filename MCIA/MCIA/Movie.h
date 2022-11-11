#pragma once
#include <iostream>
#include <string>

class Movie
{
public:
	Movie(uint16_t m_id, std::string m_title, std::string m_genre, uint16_t releaseYear, uint16_t duration);
private:
	uint16_t m_id;
	std::string m_title;
	std::string m_genre;
	uint16_t m_releaseYear;
	uint16_t m_duration;
};