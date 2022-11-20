#pragma once
#pragma warning(disable : 4996)
#include <cstdint>
#include <string>
#include <sqlite_orm/sqlite_orm.h>

namespace DB {
	using namespace sqlite_orm;
	static auto make_question_table();
}

class DatabaseManagement;

class Question
{
public:
	
	Question(const uint8_t id, const std::string& question);
	uint8_t GetId() const;
	std::string GetQuestion() const;

	friend auto DB::make_question_table();
	friend class DatabaseManagement;
	uint8_t m_id;

private:

    
	std::string m_question;

};

static auto DB::make_question_table() {

	static auto el = make_table("questions",
		make_column("id", &Question::m_id, primary_key()),
		make_column("question", &Question::m_question));
		
	return el;
}

