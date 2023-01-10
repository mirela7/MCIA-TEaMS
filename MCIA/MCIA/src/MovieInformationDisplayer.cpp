#include "../include/MovieInformationDisplayer.h"

MovieInformationDisplayer::MovieInformationDisplayer(uint32_t id, const std::string& title, const uint16_t releaseYear, const std::string genres)
	: m_movieId(id)
	, m_title(title)
	, m_releaseYear(releaseYear)
	, m_genres(genres)
{
}

void MovieInformationDisplayer::addGenre(const std::string& genre)
{
	if (m_genres.size() == 0)
		m_genres = genre;
	else {
		m_genres.append(", ");
		m_genres.append(genre);
	}
}

