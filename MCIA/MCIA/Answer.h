#pragma once
#include <cstdint>
#include <string>

class Answer
{
public:

	Answer(const uint16_t id, const uint8_t question, const std::string answer);
	std::string GetAnswer() const;
	uint16_t GetId() const;
	uint8_t GetQuestionID() const;

private:
	uint16_t m_id;
	uint8_t  m_questionId;
	std::string m_answer;
};

