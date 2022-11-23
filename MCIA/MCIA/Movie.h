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
	Movie(const uint16_t& id, const std::string& title, const std::string& genre, const uint16_t& releaseYear);
	Movie(const Movie& movie);
	Movie(Movie&& movie) noexcept;

	void SetId(const uint16_t id);
	void SetTitle(const std::string& title);
	void SetGenre(const std::string& genre);
	void SetReleaseYear(const uint16_t releaseYear);

	uint16_t GetId() const;
	std::string GetTitle() const;
	std::string GetGenre() const;
	uint16_t GetReleaseYear() const;

	Movie& operator=(const Movie& movie);
	Movie& operator=(Movie&& movie) noexcept;

private:
	uint16_t m_id;
	std::string m_title;
	std::string m_genre;
	uint16_t m_releaseYear;
};
