#include "UserAnswerQuestion.h"

UserAnswerQuestion::UserAnswerQuestion(const uint16_t userId, const uint16_t answerId, const uint16_t questionId)
	: m_questionId(questionId)
	, m_answerId(answerId)
	, m_userId(userId)
{}

uint16_t UserAnswerQuestion::GetQuestionId() const
{
	return m_questionId;
}

uint16_t UserAnswerQuestion::GetAnswerId() const
{
	return m_answerId;
}

uint16_t UserAnswerQuestion::GetUserId() const
{
	return m_userId;
}

void UserAnswerQuestion::SetUserId(uint16_t userId)
{
	m_userId = userId;
}

void UserAnswerQuestion::SetQuestionId(uint16_t questionId)
{
	m_questionId = questionId;
}

void UserAnswerQuestion::SetAnswerId(uint16_t answerId)
{
	m_answerId = answerId;
}

