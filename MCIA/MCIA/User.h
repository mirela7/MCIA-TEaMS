#pragma once
#include <string>


class User
{
public:
	
	User(std::string name, std::string password);
	
	

private:
	std::string m_name;
	std::string m_password;
	bool m_isOnline;
	
};

