#include "../include/WishListDisplayer.h"

WishListDisplayer::WishListDisplayer(uint32_t mvId, const std::string& mvTitle)
	:m_movieId(mvId),
	m_movieTitle(mvTitle)
{
}

uint32_t WishListDisplayer::GetMovieId()
{
	return m_movieId;
}

std::ostream& operator<<(std::ostream& g, WishListDisplayer wld)
{
	g << wld.m_movieId << " " << wld.m_movieTitle;
	return g;
}