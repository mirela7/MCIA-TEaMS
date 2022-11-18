#include "Question.h"

Question::Question(const uint8_t& id, const std::string question)
	: m_id(id),
	  m_question(question)
{}

uint8_t Question::GetId()
{
	return m_id;
}

std::string Question::GetQuestion()
{
	return m_question;
}
