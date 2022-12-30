#include "../include/Genre.h"
#include "../include/DatabaseManagement.h"

Genre::Genre(const std::string& name)
	:m_name(name)
{}

Genre::Genre(const uint16_t id, const std::string& name)
	: m_id(id)
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

void Genre::ParseGenres()
{
	auto& storage = DatabaseManagement::GetInstance().GetStorage();
	auto moviesGenres = storage.select(columns(&MovieIntermediary::GetGenre));
	int id = 1;
	for (auto& tpl : moviesGenres)
	{
		std::string name = get<0>(tpl);
		std::string genre = "";
		for (int i = 0; i < name.size(); i++)
		{
			if (name[i] == '|')
			{
				Genre g(-1, genre);
				DatabaseManagement::GetInstance().GetStorage().replace(g);
				genre = "";
				i++;
			}
			genre.push_back(name[i]);
		}
	}
}
