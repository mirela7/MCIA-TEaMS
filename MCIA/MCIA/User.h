#pragma once
#include <string>
#include <sqlite_orm/sqlite_orm.h>
#include <cstdint>

class User
{
public:
	User() = default;
	User(uint16_t id,std::string name, std::string password);
	User(const User& other);
	User& operator=(const User& user);
	User(User&& other);
	~User();

private:
	uint16_t m_id;
	std::string m_name;
	std::string m_password;
	bool m_isOnline;
	
};

