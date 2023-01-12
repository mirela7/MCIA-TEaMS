#include "../include/WishList.h"

WishList::WishList(const uint16_t user_id, const uint32_t movie_id)
	:m_user_id(user_id)
	,m_movie_id(movie_id)
{
}

uint16_t WishList::GetUserId() const
{
	return m_user_id;
}

uint32_t WishList::GetMovieId() const
{
	return m_movie_id;
}

void WishList::SetUserId(const uint16_t user_id)
{
	m_user_id = user_id;
}

void WishList::SetMovieId(const uint32_t movie_id)
{
	m_movie_id = movie_id;
}
