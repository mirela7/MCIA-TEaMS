#pragma once
#include <cstdint>

class UserAnswerQuestion
{
public:
	UserAnswerQuestion(const uint16_t userId, const uint16_t answerId, const uint16_t questionId);

	uint16_t GetQuestionId()const;
	uint16_t GetAnswerId()const;
	uint16_t GetUserId()const;

	void SetUserId(uint16_t userId);
	void SetQuestionId(uint16_t questionId);
	void SetAnswerId(uint16_t answerId);

private:
	uint16_t m_userId;
	uint16_t m_questionId;
	uint16_t m_answerId;
	
};

