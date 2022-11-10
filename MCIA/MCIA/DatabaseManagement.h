#pragma once

#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;


class DatabaseManagement
{
private:
    static DatabaseManagement* m_database;
private:
    DatabaseManagement() = default;
    static auto& getStorage() {
        static auto storage = make_storage("testdb.db"
           /* make_table("User",
                make_column("Id", &User::m_id, primary_key()),
                make_column("name", &User::m_name),
                make_column("password", &User::m_password)),
            make_table("MovieDummy",
                make_column("Id", &MovieDummy::id, primary_key()),
                make_column("name", &MovieDummy::name))*/
        );
        return storage;
    }

public:
    static DatabaseManagement& GetInstance();
    
    template<typename T>
    int insertElement(const T& el);

    template<typename T>
    T getElementById(const int32_t id);
};

template<typename T>
int DatabaseManagement::insertElement(const T& el)
{
    auto& st = getStorage();
    return st.insert(el);
}

template<typename T>
inline T DatabaseManagement::getElementById(const int32_t id)
{
    auto& st = getStorage();
    return st.get<T>(id);
}
