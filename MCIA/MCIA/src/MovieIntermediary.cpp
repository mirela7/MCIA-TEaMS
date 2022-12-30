#include "../include/MovieIntermediary.h"

MovieIntermediary::MovieIntermediary(uint16_t id, const std::string& title, const std::string& genre)
	:m_id(id)
	,m_title(title)
	,m_genre(genre)
{}

void MovieIntermediary::SetId(uint16_t id)
{
	m_id = id;
}

void MovieIntermediary::SetTitle(const std::string& title)
{
	m_title = title;
}

void MovieIntermediary::SetGenre(const std::string& genres)
{
	m_genre = genres;
}

uint16_t MovieIntermediary::GetId() const
{
	return m_id;
}

std::string MovieIntermediary::GetTitle() const
{
	return m_title;
}

std::string MovieIntermediary::GetGenre() const
{
	return m_genre;
}