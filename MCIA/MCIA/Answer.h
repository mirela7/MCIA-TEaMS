#pragma once
#pragma warning(disable : 4996)
#include <cstdint>
#include <string>
#include "Question.h"
class DatabaseManagement;

class Answer
{
public:
	Answer() = default;
	Answer(const uint16_t id, const uint16_t question, const std::string answer);
	std::string GetAnswer() const;
	uint16_t GetId() const;
	uint16_t GetQuestionID() const;

	void SetId(uint16_t id);
	void SetQuestionId(uint16_t questionId);
	void SetAnswear(const std::string& answear);

	friend class DatabaseManagement;

private:
	uint16_t m_id;
	uint16_t  m_questionId;
	std::string m_answer;
};


