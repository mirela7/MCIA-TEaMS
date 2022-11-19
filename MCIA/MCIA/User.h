#pragma once
#pragma warning(disable : 4996)
#include <string>
#include <cstdint>
#include <fstream>
#include <sqlite_orm/sqlite_orm.h>

namespace DB {
	using namespace sqlite_orm;
	static auto make_user_table();
}

class DatabaseManagement;

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

	friend auto DB::make_user_table();
	friend class DatabaseManagement;
private:
	uint16_t m_id;
	std::string m_name;
	std::string m_password;
	bool m_isOnline;
	
};

static auto DB::make_user_table() {
	static auto el = make_table("user",
		make_column("Id", &User::m_id, primary_key()),
		make_column("name", &User::m_name),
		make_column("password", &User::m_password));
	return el;
}
