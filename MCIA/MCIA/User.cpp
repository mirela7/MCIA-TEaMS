#include "User.h"
#include <sqlite_orm/sqlite_orm.h>
using namespace sqlite_orm;

User::User(const uint16_t& id, const std::string& name, const std::string& password)
	: m_id(id),
	  m_name(name),
	  m_password(password)
{}

User::User(const User & other)
{
	m_id = other.m_id;
	m_name = other.m_name;
	m_password = other.m_password;
}

User::User(const std::string& name, const std::string& password)
{
	m_id = 0;
	m_name = name;
	m_password = password;
}

User& User::operator=(const User& user)
{
	if (this != &user) {  

		m_id = user.m_id;
		m_name = user.m_name;
		m_password = user.m_password;
	}

	return *this;
}

User& User::operator=(User&& other) noexcept
{
	m_id = other.m_id;
	m_name = other.m_name;
	m_password = other.m_password;		
	new(&other) User;
	return *this;
}

User::User(User&& other) noexcept
{
	*this = std::move(other);
}

User::~User()
{}

std::string User::GetPassword()
{
	return m_password;
}

std::string User::GetName()
{
	return m_name;
}
