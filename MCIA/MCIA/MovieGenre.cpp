#include "MovieGenre.h"

MovieGenre::MovieGenre(const uint16_t movieId, const uint16_t genreId)
	:m_movieId(movieId)
	, m_genreId(genreId)
{}

uint16_t MovieGenre::GetMovieId() const
{
	return m_movieId;
}

uint16_t MovieGenre::GetGenreId() const
{
	return m_genreId;
}

void MovieGenre::SetMovieId(const uint16_t movieId)
{
	m_movieId = movieId;
}

void MovieGenre::SetGenreId(const uint16_t genreId)
{
	m_genreId = genreId;
}
