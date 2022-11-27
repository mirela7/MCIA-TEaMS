#include "DatabaseManagement.h"
#include <iostream>

DatabaseManagement* DatabaseManagement::m_database = nullptr;

DatabaseManagement& DatabaseManagement::GetInstance()
{
    if (m_database == nullptr) {
        m_database = new DatabaseManagement();
        // m_database->m_storage.sync_schema();
    }
    return *m_database;
}


User DatabaseManagement::GetUserByName(const std::string& name)
{
    auto el = m_storage.get_all<User>(where(c(&User::GetName) == name));
    if (el.empty())
        throw CodedException(OperationStatus::DB_ENTITY_NOT_FOUND, "Entity with name \"" + name + "\" not found.");
    return el[0];
}

    
bool DatabaseManagement::IsRegistered(const std::string& name)
{
    auto el = m_storage.get_all<User>(where(c(&User::GetName) == name));

    return !el.empty();
}

bool DatabaseManagement::CheckPassword(const std::string& name, const std::string& password)
{
    auto user = GetUserByName(name);
    return user.GetPassword() == password;
}

storage_type& DatabaseManagement::GetStorage()
{
    return m_storage;
}
