#pragma once
#pragma warning(disable : 4996)
#include <cstdint>
#include <string>

class DatabaseManagement;

class Question
{
public:
	
	Question(const uint8_t id, const std::string& question);

	uint16_t GetId() const;
	std::string GetQuestion() const;

	void SetId(uint16_t id);
	void SetQuestion(const std::string& question);

	friend class DatabaseManagement;

private:
	uint16_t m_id;
	std::string m_question;

};



