#include "Question.h"

Question::Question(const uint8_t id, const std::string& question)
	: m_id(id),
	  m_question(question)
{}

uint8_t Question::GetId() const
{
	return m_id;
}

std::string Question::GetQuestion() const
{
	return m_question;
}
