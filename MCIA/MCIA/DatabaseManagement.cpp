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
    //TODO: Tratare eroare caz inexistent
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

