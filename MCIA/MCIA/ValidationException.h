#pragma once
#include <exception>
#include <string>

class ValidationException : public std::exception
{
public:
	explicit ValidationException(const char* code, const char* message);
	explicit ValidationException(const std::string& code, const std::string& message);

	virtual ~ValidationException() noexcept;
	virtual const char* what() const noexcept;

protected:
	std::string m_message;
};

