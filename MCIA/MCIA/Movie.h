#pragma once
#pragma warning(disable : 4996)
#include <string>
#include <iostream>

class Movie
{
public:
	Movie() = default;
	Movie(const uint16_t id, const std::string& title, const uint16_t releaseYear, const float rating);
	Movie(const Movie& movie);
	Movie(Movie&& movie) noexcept;

	void SetId(const uint16_t id);
	void SetTitle(const std::string& title);
	void SetReleaseYear(const uint16_t releaseYear);
	void SetRating(const float rating);

	uint16_t GetId() const;
	std::string GetTitle() const;
	uint16_t GetReleaseYear() const;
	float GetRating() const;

	void parse();
	
	Movie& operator=(const Movie& movie);
	Movie& operator=(Movie&& movie) noexcept;
	friend std::ostream& operator<<(std::ostream& out, const Movie& movie);

private:
	uint16_t m_id; 
	std::string m_title;
	uint16_t m_releaseYear;
	float m_rating;
};
