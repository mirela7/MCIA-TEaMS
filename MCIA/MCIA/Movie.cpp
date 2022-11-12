#include "Movie.h"



Movie::Movie(const int id, const std::string& title, const std::string& genre, const uint16_t releaseYear, const uint16_t duration)
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

Movie::Movie(Movie&& movie) noexcept
{
	*this = std::move(movie);
}

Movie& Movie::operator=(const Movie& movie)
{
	m_id = movie.m_id;
	m_title = movie.m_title;
	m_genre = movie.m_genre;
	m_releaseYear = movie.m_releaseYear;
	m_duration = movie.m_duration;
	return *this;
}

Movie& Movie::operator=(Movie&& movie) noexcept
{
	m_id = movie.m_id;
	m_title = movie.m_title;
	m_genre = movie.m_genre;
	m_releaseYear = movie.m_releaseYear;
	m_duration = movie.m_duration;
	new(&movie) Movie;
	return *this;
}