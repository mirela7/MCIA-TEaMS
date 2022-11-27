#pragma once
#pragma warning(disable : 4996)
#include <cstdint>
#include <string>

class DatabaseManagement;

class Question
{
public:
	Question() = default;
	Question(const uint16_t id, const std::string& question, const uint16_t msChoise);

	uint16_t GetId() const;
	std::string GetQuestion() const;
	uint16_t GetChoice() const;
	

	void SetId(uint16_t id);
	void SetQuestion(const std::string& question);
	void SetChoice(uint16_t msChoise);

	friend class DatabaseManagement;


private:
	uint16_t m_id;
	std::string m_question;
	uint16_t m_msChoise;


};




