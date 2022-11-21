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

uint16_t Answer::GetQuestionID() const
{
	return m_questionId;
}

void Answer::SetId(uint16_t id)
{
	m_id = id;
}

void Answer::SetQuestionId(uint16_t questionId)
{
	m_questionId = questionId;
}

void Answer::SetAnswear(const std::string& answear)
{
	m_answer = answear;
}
