#include "Question.h"

Question::Question(const uint16_t id, const std::string& question, const uint16_t msChoise)
	: m_id(id),
	  m_question(question),
	  m_msChoise(msChoise)
{}

uint16_t Question::GetId() const
{
	return m_id;
}

std::string Question::GetQuestion() const
{
	return m_question;
}

uint16_t Question::GetChoice() const
{
	return m_msChoise;
}

void Question::SetId(uint16_t id)
{
	m_id = id;
}

void Question::SetQuestion(const std::string& question)
{
	m_question = question;
}

void Question::SetChoice(uint16_t msChoise)
{
	m_msChoise = msChoise;
}
