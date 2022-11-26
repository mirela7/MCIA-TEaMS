#pragma once
#pragma warning(disable : 4996) /* To suppress warnings regarding deprecated C++17 functions. */
#include <sqlite_orm/sqlite_orm.h>
#include "User.h"
#include "CodedException.h"
#include "OperationStatus.h"
#include "Question.h"
#include "Answer.h"
#include "DBPage.h"

using namespace sqlite_orm;

namespace {

    auto make_user_table() {
        static auto el = make_table("user",
            make_column("Id", 
                &User::GetId,
                &User::SetId,
                primary_key()),
            make_column("name",
                &User::GetName,
                &User::SetName),
            make_column("password", 
                &User::GetPassword,
                &User::SetPassword));
        return el;
    }

    auto make_question_table() {

        static auto el = make_table("questions",
            make_column("id", 
                &Question::GetId,
                &Question::SetId,
                primary_key()),
            make_column("question",
                &Question::GetQuestion,
                &Question::SetQuestion));

        return el;
    }

    auto make_answer_table() {
        static auto el = make_table("questions"
            , make_column("id",
                &Answer::GetId,
                &Answer::SetId,
                primary_key())
            , make_column("question_id",
                &Answer::GetQuestionID,
                &Answer::SetQuestionId)
            , make_column("answer",
                &Answer::GetAnswer,
                &Answer::SetAnswear)
            , foreign_key(&Answer::GetAnswer).references(&Question::GetId)
        );

        return el;
    }

    auto getStorage() {
        static auto storage = make_storage("DBtest.db"
           , make_user_table()
           , make_question_table()
           , make_answer_table()
        );

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


    // TODO: REFACTOR
    User GetUserByName(const std::string& name);

    template<class TEntity, class sqlite_expression>
    DBPage<TEntity> PagedSelect(const int idxOfPage, const int nmbRowsPerPage, sqlite_expression filters);

    storage_type& GetStorage();
    
private:
    DatabaseManagement() = default;
    DatabaseManagement(DatabaseManagement&) = delete;
    void operator=(DatabaseManagement&) = delete;

protected:
    storage_type m_storage = getStorage();
    static DatabaseManagement* m_database;
};


template<typename T>
int32_t DatabaseManagement::InsertElement(const T& el)
{
    // TODO CHECK INSERT
    return m_storage.insert(el);
}

template<typename T>
inline T DatabaseManagement::GetElementById(const int32_t id)
{
    // TODO FAIL PROOF GET
    return m_storage.get<T>(id);
}

template<class TEntity, class sqlite_expression>
inline DBPage<TEntity> DatabaseManagement::PagedSelect(const int idxOfPage, const int nmbRowsPerPage, sqlite_expression filters)
{
    int totalPages = ceil(m_storage.count<TEntity>(where(filters)) * 1.0 / nmbRowsPerPage);
    auto result = m_storage.get_all<TEntity>(where(filters), limit(nmbRowsPerPage, offset(idxOfPage * nmbRowsPerPage)));
    return DBPage(result, totalPages, idxOfPage);
}