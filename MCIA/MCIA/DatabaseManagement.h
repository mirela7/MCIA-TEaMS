#pragma once
#pragma warning(disable : 4996) /* To suppress warnings regarding deprecated C++17 functions. */
#include <iostream>
#include "User.h"
#include "CodedException.h"
#include "OperationStatus.h"
#include "Question.h"
#include "Answer.h"
#include "UserAnswerQuestion.h"
#include <sqlite_orm/sqlite_orm.h>

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
                &Question::SetQuestion),
            make_column("mschoice",
                &Question::GetChoice,
                &Question::SetChoice)
        );

        return el;
    }

    auto make_answer_table() {
        static auto el = make_table("answers"
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

    auto make_user_answer_question_table() {
        static auto el = make_table("user_answer_question"
            , make_column("user_id",
                &UserAnswerQuestion::GetUserId,
                &UserAnswerQuestion::SetUserId,
             
                foreign_key(&UserAnswerQuestion::GetUserId).references(&User::GetId)
            )
            , make_column("answer_id",
                &UserAnswerQuestion::GetAnswerId,
                &UserAnswerQuestion::SetAnswerId,
              foreign_key(&UserAnswerQuestion::GetAnswerId).references(&Answer::GetId)
            )
            ,  make_column("question_id",
                &UserAnswerQuestion::GetQuestionId,
                &UserAnswerQuestion::SetQuestionId,
                foreign_key(&UserAnswerQuestion::GetQuestionId).references(&Question::GetId)
            ),
            primary_key(&UserAnswerQuestion::GetUserId, &UserAnswerQuestion::GetAnswerId, &UserAnswerQuestion::GetQuestionId)
        );

        return el;
    }


    auto getStorage() {
        static auto storage = make_storage("DBtest.db"
           , make_user_table()
           , make_question_table()
           , make_answer_table()
           , make_user_answer_question_table()
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


    User GetUserByName(const std::string& name);    
    bool IsRegistered(const std::string& name);

    bool CheckPassword(const std::string& name, const std::string &password);
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
    try
    {
        return m_storage.insert(el);
    }
    catch (std::exception e)
    {
        std::cout<<e.what();
    }
    
}

template<typename T>
inline T DatabaseManagement::GetElementById(const int32_t id)
{
    // auto& st = getStorage();
    // TODO FAIL PROOF GET
    return m_storage.get<T>(id);
}

