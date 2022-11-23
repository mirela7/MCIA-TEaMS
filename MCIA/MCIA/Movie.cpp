#include "Movie.h"

Movie::Movie(const uint16_t id, const std::string& title, const std::string& genre, const uint16_t releaseYear)
	: m_id(id)
	, m_title(title)
	, m_genre(genre)
	, m_releaseYear(releaseYear)
{}

Movie::Movie(const Movie& movie)
{
	*this = movie;
}

Movie::Movie(Movie&& movie) noexcept
{
	*this = std::move(movie);
}

void Movie::SetId(const uint16_t id)
{
	m_id = id;
}
void Movie::SetTitle(const std::string& title)
{
	m_title = title;
}

void Movie::SetGenre(const std::string& genre)
{
	m_genre = genre;
}

void Movie::SetReleaseYear(const uint16_t releaseYear)
{
	m_releaseYear = releaseYear;
}

uint16_t Movie::GetId() const
{
	return m_id;
}

std::string Movie::GetTitle() const
{
	return m_title;
}

std::string Movie::GetGenre() const
{
	return m_genre;
}

uint16_t Movie::GetReleaseYear() const
{
	return m_releaseYear;
}

Movie& Movie::operator=(const Movie& movie)
{
	m_id = movie.m_id;
	m_title = movie.m_title;
	m_genre = movie.m_genre;
	m_releaseYear = movie.m_releaseYear;
	return *this;
}

Movie& Movie::operator=(Movie&& movie) noexcept
{
	m_id = movie.m_id;
	m_title = movie.m_title;
	m_genre = movie.m_genre;
	m_releaseYear = movie.m_releaseYear;
	new(&movie) Movie;
	return *this;
}
