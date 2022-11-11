#pragma once
#include <string>
#include <cstdint>

class User
{
public:
	User() = default;
	User(const uint16_t& id,const std::string& name, const std::string& password);
	User(const User& other);
	User& operator=(const User& user);
	User& operator=(User&& other) noexcept;
	User(User&& other) noexcept;
	~User();

private:
	uint16_t m_id;
	std::string m_name;
	std::string m_password;
	bool m_isOnline;
	
};

