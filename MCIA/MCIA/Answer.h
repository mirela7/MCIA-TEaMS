#pragma once
#pragma warning(disable : 4996)
#include <cstdint>
#include <string>
#include "Question.h"
#include <sqlite_orm/sqlite_orm.h>

namespace DB {
	using namespace sqlite_orm;
	static auto make_answer_table();
}

class DatabaseManagement;

class Answer
{
public:

	Answer(const uint16_t id, const uint8_t question, const std::string answer);
	std::string GetAnswer() const;
	uint16_t GetId() const;
	uint8_t GetQuestionID() const;

	friend auto DB::make_answer_table();
	friend class DatabaseManagement;

private:
	uint16_t m_id;
	uint8_t  m_questionId;
	std::string m_answer;
};

static auto DB::make_answer_table() {

	static auto el = make_table("questions",
		make_column("id", &Answer::m_id, primary_key()),
		make_column("question_id", &Answer::m_questionId),
		make_column("answer", &Answer::m_answer),
		foreign_key(&Answer::m_answer).references(&Question::m_id)
	);

	return el;
}

