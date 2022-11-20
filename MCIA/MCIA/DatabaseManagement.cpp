#include "DatabaseManagement.h"
#include <iostream>

DatabaseManagement* DatabaseManagement::m_database = nullptr;

DatabaseManagement& DatabaseManagement::GetInstance()
{
    if (m_database == nullptr)
        m_database = new DatabaseManagement();
    return *m_database;
}


User DatabaseManagement::GetUserByName(const std::string& name)
{
    auto& st = getStorage();
    auto el = st.get_all<User>(where(c(&User::m_name) == name));
    if (el.empty())
        throw CodedException(OperationStatus::DB_ENTITY_NOT_FOUND, "Entity with name \"" + name + "\" not found.");
    return el[0];
}
    
bool DatabaseManagement::IsRegistered(const std::string& name)
{
    auto& st = getStorage();
    auto el = st.get_all<User>(where(c(&User::m_name) == name));

    return !el.empty();
}

bool DatabaseManagement::CheckPassword(const std::string& name, const std::string& password)
{
    auto user = GetUserByName(name);
    return user.GetPassword() == password;
}

