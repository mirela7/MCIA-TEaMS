#pragma once
#include <cstdint>
#include <string>

class Answer
{
public:

	Answer(const uint16_t& m_id, const uint8_t& m_question, const std::string& m_answer);
	std::string GetAnswer();
	uint16_t GetId();
	uint8_t GetQuestionID();

private:
	uint16_t m_id;
	uint8_t  m_questionId;
	std::string m_answer;
};

