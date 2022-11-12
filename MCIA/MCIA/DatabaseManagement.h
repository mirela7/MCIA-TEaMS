#pragma once
#include "User.h"
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;


class DatabaseManagement
{
public:
    static DatabaseManagement& GetInstance();

    template<typename T>
    int32_t InsertElement(const T& el);

    template<typename T>
    T GetElementById(const int32_t id);

    User GetUserByName(const std::string& name);
    bool IsRegistered(const std::string& name);

    bool CheckPassword(const std::string& name, const std::string &password);
    
protected:
    DatabaseManagement() = default;
    static auto& getStorage() {
        static auto storage = make_storage("testdb.db",
           make_table("User",
                make_column("Id", &User::m_id, primary_key()),
                make_column("name", &User::m_name),
                make_column("password", &User::m_password)));
            /*,
            make_table("MovieDummy",
                make_column("Id", &MovieDummy::id, primary_key()),
                make_column("name", &MovieDummy::name))*/
        return storage;
    }

protected:
    static DatabaseManagement* m_database;
};

template<typename T>
int32_t DatabaseManagement::InsertElement(const T& el)
{
    auto& st = getStorage();
    // TODO CHECK INSERT
    return st.insert(el);
}

template<typename T>
inline T DatabaseManagement::GetElementById(const int32_t id)
{
    auto& st = getStorage();
    // TODO FAIL PROOF GET
    return st.get<T>(id);
}
