#pragma once
#include <cstdint>
#include <string>

class Question
{
public:
	
	Question(const uint8_t& id, const std::string question);
	uint8_t GetId();
	std::string GetQuestion();

private:

	uint8_t m_id;
	std::string m_question;

};

