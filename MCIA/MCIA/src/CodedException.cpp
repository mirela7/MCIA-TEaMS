#include "../include/CodedException.h"

CodedException::CodedException(const char* code, const char* message)
{
	m_message = "[" + std::string(code) + "]" + message;
}

CodedException::CodedException(const OperationStatus::Code code, const std::string& message)
{
	m_message = "[" + std::string(OperationStatus(code)) + "]" + message;
}

CodedException::CodedException(const std::string& code, const std::string& message)
	: m_message("[" + code + "]" + message)
{
}

std::string CodedException::GetCode() const
{
	return m_message.substr(1, m_message.find_first_of("]") - 1);
}

std::string CodedException::GetWhat() const
{
	return std::string(what());
}

std::string CodedException::GetMessage() const
{
	std::string fullMessage = GetWhat();
	int lastParanthesesPos = fullMessage.find_last_of("]") + 1;
	return fullMessage.substr(lastParanthesesPos, fullMessage.size() - lastParanthesesPos);
}

CodedException::~CodedException() noexcept
{
}

const char* CodedException::what() const noexcept
{
	return m_message.c_str();
}
