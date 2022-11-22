#include "Question.h"

Question::Question(const uint8_t id, const std::string& question)
	: m_id(id),
	  m_question(question)
{}

uint16_t Question::GetId() const
{
	return m_id;
}

std::string Question::GetQuestion() const
{
	return m_question;
}

void Question::SetId(uint16_t id)
{
	m_id = id;
}

void Question::SetQuestion(const std::string& question)
{
	m_question = question;
}
