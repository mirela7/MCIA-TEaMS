#pragma once
#pragma warning(disable : 4996)
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <sstream>
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;

class Movie
{
public:
	Movie() = default;
	Movie(const int id, const std::string& title, const std::string& genre, const uint16_t releaseYear, const uint16_t duration);
	Movie(const Movie& movie);
	Movie(Movie&& movie) noexcept;

	Movie& operator=(const Movie& movie);
	Movie& operator=(Movie&& movie) noexcept;

	static void parse()
	{
		/*static auto storage = make_storage("DBtest.db",
			make_table("movietable",
				make_column("movieId", &MovieIntermediary::m_id, primary_key()),
				make_column("title", &MovieIntermediary::m_title),
				make_column("genres", &MovieIntermediary::m_genre)),
			make_table("movie",
				make_column("Id", &Movie::m_id, primary_key()),
				make_column("title", &Movie::m_title),
				make_column("genre", &Movie::m_genre),
				make_column("release_year", &Movie::m_title),
				make_column("duration", &Movie::m_genre))
		);
		
		auto allMovies = storage.select(columns(&MovieIntermediary::m_id, &MovieIntermediary::m_title, &MovieIntermediary::m_genre));

		for (auto& tpl : allMovies) {
			Movie m(std::get<0>(tpl), std::get<1>(tpl), std::get<2>(tpl), 0, 0);
			storage.insert(m);
		}*/
	}

private:
	//modified
	friend class DatabaseManagement;

	int m_id;
	std::string m_title;
	std::string m_genre;
	uint16_t m_releaseYear;
	uint16_t m_duration;
};