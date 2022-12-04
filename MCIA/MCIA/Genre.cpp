#include "Genre.h"

Genre::Genre(const uint16_t id, const std::string& name)
	:m_id(id)
	, m_name(name)
{}

void Genre::SetId(const uint16_t id)
{
	m_id = id;
}

void Genre::SetName(const std::string& name)
{
	m_name = name;
}

uint16_t Genre::GetId() const
{
	return m_id;
}

std::string Genre::GetName() const
{
	return m_name;
}
