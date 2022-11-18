#pragma once
#include <cstdint>

class UserAnswerQuestion
{
public:
	UserAnswerQuestion(const uint16_t userId, const uint16_t answerId, const uint8_t questionId);
	uint8_t GetQuestionId()const;
	uint16_t GetAnswerId()const;
	uint16_t GetUserID()const;

private:
	uint8_t m_questionId;
	uint16_t m_answerId;
	uint16_t m_userId;
};

