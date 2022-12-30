#pragma once
#pragma warning(disable : 4996)
#include <cstdint>
#include <string>

class MovieIntermediary
{
public:
	MovieIntermediary() = default;
	MovieIntermediary(uint16_t id, const std::string& title, const std::string& genres);

	void SetId(uint16_t id);
	void SetTitle(const std::string& title);
	void SetGenre(const std::string& genres);

	uint16_t GetId() const;
	std::string GetTitle() const;
	std::string GetGenre() const;

private:
	uint16_t m_id;
	std::string m_title;
	std::string m_genre;
};