#pragma once
#pragma warning(disable : 4996)
#include <string>
#include <cstdint>
#include <fstream>
#include <sqlite_orm/sqlite_orm.h>


class DatabaseManagement;

class User
{
public:
	User() = default;
	User(const uint16_t& id,const std::string& name, const std::string& password);
	User(const std::string& name, const std::string& password);
	User(const User& other);
	User(User&& other) noexcept;
	
	std::string GetName() const;
	std::string GetPassword() const;
	uint16_t GetId() const;

	void SetName(const std::string& name);
	void SetPassword(const std::string& password);
	void SetId(uint16_t id);

	User& operator=(const User& user);
	User& operator=(User&& other) noexcept;
	
	~User();

	friend std::ostream& operator<<(std::ostream& g, const User& u) {
		return g << u.m_id << " " << u.m_name;
	}

	friend class DatabaseManagement;
private:
	uint16_t m_id;
	std::string m_name;
	std::string m_password;
	bool m_isOnline;
	
};

