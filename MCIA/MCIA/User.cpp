#include "User.h"
#include <sqlite_orm/sqlite_orm.h>
using namespace sqlite_orm;

User::User(uint16_t id, std::string name, std::string password)
	: m_id(id),
	  m_name(name),
	  m_password(password)
{}
