#include "../include/MovieGenre.h"
#include "../include/DatabaseManagement.h"

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


void MovieGenre::LinkGenreMovie()
{
	auto& storage = DatabaseManagement::GetInstance().GetStorage();
	auto moviesGenres = storage.select(columns(&MovieIntermediary::GetId, &MovieIntermediary::GetGenre));
	auto genres = storage.select(columns(&Genre::GetId, &Genre::GetName));
	int count = 0;
	for (auto& tpl : moviesGenres)
	{
		uint16_t movieId = get<0>(tpl);
		std::string name = get<1>(tpl);
		std::string genre = "";
		for (int i = 0; i < name.size(); i++)
		{
			if (name[i] == '|')
			{
				for (auto& genreData : genres)
				{
					if (get<1>(genreData) == genre)
					{
						uint16_t genreId = get<0>(genreData);
						MovieGenre element(movieId, genreId);
						DatabaseManagement::GetInstance().GetStorage().replace(element);
						break;
					}
				}
				genre = "";
				i++;
			}
			genre.push_back(name[i]);
		}
		count++;
		std::cout << count << '\n';
	}
}
