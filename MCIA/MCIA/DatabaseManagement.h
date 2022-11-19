#pragma once
#pragma warning(disable : 4996)
#include "User.h"
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;

namespace {
    auto getStorage() {
        static auto storage = make_storage("DBtest.db",
            make_table("user",
                make_column("Id", &User::m_id, primary_key()),
                make_column("name", &User::m_name),
                make_column("password", &User::m_password)));

        return storage;
    }

    using storage_type = decltype(getStorage());
};


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
    

protected:
    static inline storage_type storage = getStorage();
    static DatabaseManagement* m_database;
};


template<typename T>
int32_t DatabaseManagement::InsertElement(const T& el)
{
    // TODO CHECK INSERT
    return storage.insert(el);
}

template<typename T>
inline T DatabaseManagement::GetElementById(const int32_t id)
{
    // auto& st = getStorage();
    // TODO FAIL PROOF GET
    return storage.get<T>(id);
}