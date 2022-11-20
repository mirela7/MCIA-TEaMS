#pragma once
#include <exception>
#include <string>
#include "OperationStatus.h"

class CodedException : public std::exception
{
public:
	explicit CodedException(const char* code, const char* message);
	explicit CodedException(const OperationStatus::Code code, const std::string& message);
	explicit CodedException(const std::string& code, const std::string& message);

	virtual ~CodedException() noexcept;
	virtual const char* what() const noexcept;

protected:
	std::string m_message;
};

