#include "ValidationException.h"

ValidationException::ValidationException(const char* code, const char* message)
{
	m_message = "[" + std::string(code) + "] " + message;
}

ValidationException::ValidationException(const std::string& code, const std::string& message)
	: m_message("[" + code + "] " + message)
{
}

ValidationException::~ValidationException() noexcept
{
}

const char* ValidationException::what() const noexcept
{
	return m_message.c_str();
}
