#pragma once
#pragma warning(disable : 4996)
#include "User.h"
#include "Question.h"
#include "Answer.h"
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;

namespace DB{
    static auto getStorage() {
        static auto storage = make_storage("DBtest.db",
            make_user_table(),
            make_question_table(),
            make_answer_table()
        );

        return storage;
    };
    
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
    
private:
    DatabaseManagement() = default;
    DatabaseManagement(DatabaseManagement&) = delete;
    void operator=(DatabaseManagement&) = delete;

protected:
    static inline DB::storage_type storage = DB::getStorage();
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