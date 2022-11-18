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

uint16_t UserAnswerQuestion::GetUserID() const
{
	return m_userId;
}
