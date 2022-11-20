#include "CodedException.h"

CodedException::CodedException(const char* code, const char* message)
{
	m_message = "[" + std::string(code) + "] " + message;
}

CodedException::CodedException(const OperationStatus::Code code, const std::string& message)
{
	m_message = "[" + std::string(OperationStatus(code)) + "] " + message;
}

CodedException::CodedException(const std::string& code, const std::string& message)
	: m_message("[" + code + "] " + message)
{
}

CodedException::~CodedException() noexcept
{
}

const char* CodedException::what() const noexcept
{
	return m_message.c_str();
}
