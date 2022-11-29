#include "WatchedMovie.h"

WatchedMovie::WatchedMovie(const uint16_t user_id, const uint16_t movie_id, const uint8_t rating)
	: m_user_id(user_id)
	, m_movie_id(movie_id)
	, m_rating(rating)
{
}

uint16_t WatchedMovie::GetUserId() const
{
	return m_user_id;
}

uint16_t WatchedMovie::GetMovieId() const
{
	return m_movie_id;
}

uint8_t WatchedMovie::GetRating() const
{
	return m_rating;
}

void WatchedMovie::SetUserId(const uint16_t user_id)
{
	m_user_id = user_id;
}

void WatchedMovie::SetMovieId(const uint16_t movie_id)
{
	m_movie_id = movie_id;
}

void WatchedMovie::SetRating(const uint8_t rating)
{
	m_rating = rating;
}
