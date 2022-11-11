#include "Movie.h"

Movie::Movie(const uint16_t id, const std::string& title, const std::string& genre, const uint16_t releaseYear, const uint16_t duration)
	: m_id(id)
	, m_title(title)
	, m_genre(genre)
	, m_releaseYear(releaseYear)
	, m_duration(duration)
{}

Movie::Movie(const Movie & movie)
{
	*this = movie;
}