#include "UserAnswerQuestion.h"

UserAnswerQuestion::UserAnswerQuestion(const uint16_t userId, const uint16_t answerId, const uint8_t questionId)
	:m_questionId(questionId),
	 m_answerId(answerId),
	 m_userId(userId)
{}

uint8_t UserAnswerQuestion::GetQuestionId() const
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

void UserAnswerQuestion::SetQuestion(uint16_t answerId)
{
	m_answerId = answerId;
}

void UserAnswerQuestion::SetAnswer(uint8_t questionId)
{
	m_questionId = questionId;
}

