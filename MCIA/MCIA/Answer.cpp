#include "Answer.h"

Answer::Answer(const uint16_t id, const uint8_t question, const std::string answer)
	: m_id(id),
	  m_questionId(question),
	  m_answer(answer)
{}

std::string Answer::GetAnswer() const
{
	return m_answer;
}

uint16_t Answer::GetId() const
{
	return m_id;
}

uint8_t Answer::GetQuestionID() const
{
	return m_questionId;
}
