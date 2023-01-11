#include "../include/CodedException.h"
#include <cstring>

CodedException::CodedException(const char* code, const char* message)
{
	m_code = OperationStatus::StringToCode(code);
	std::string msg = "[" + std::string(code) + "]" + message;
	m_message = new char[msg.size()];
	strcpy(m_message, msg.c_str());
}

CodedException::CodedException(const OperationStatus::Code code, const std::string& message)
{
	m_code = code;
	std::string msg = "[" + OperationStatus::CodeToString(code) + "]" + message;
	m_message = new char[msg.size()];
	strcpy(m_message, msg.c_str());
}

OperationStatus::Code CodedException::GetCode() const
{
	return m_code;
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
	//delete[] m_message;
	//TODO look into right way to handle memory here
}

const char* CodedException::what() const noexcept
{
	return m_message;
}
