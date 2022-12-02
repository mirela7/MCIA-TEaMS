#pragma once
#pragma warning(disable : 4996)
#include <string>
#include <iostream>

class Genre
{
public:
	Genre() = default;
	Genre(const uint16_t id, const std::string& name);

	void SetId(const uint16_t id);
	void SetName(const std::string& name);

	uint16_t GetId() const;
	std::string GetName() const;
private:
	uint16_t m_id;
	std::string m_name;
};