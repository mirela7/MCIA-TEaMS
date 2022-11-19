#pragma once
#pragma warning(disable : 4996)
#include <string>
#include <cstdint>
#include <fstream>

class User
{
public:
	User() = default;
	User(const uint16_t& id,const std::string& name, const std::string& password);
	User(const User& other);
	User(User&& other) noexcept;
	
	std::string GetName();
	std::string GetPassword();

	User& operator=(const User& user);
	User& operator=(User&& other) noexcept;
	
	~User();

	friend std::ostream& operator<<(std::ostream& g, const User& u) {
		return g << u.m_id << " " << u.m_name;
	}
private:
	friend class DatabaseManagement;

public:
	uint16_t m_id;
	std::string m_name;
	std::string m_password;
	bool m_isOnline;
	
};

