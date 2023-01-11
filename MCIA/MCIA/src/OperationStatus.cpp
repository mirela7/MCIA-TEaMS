#include "../include/OperationStatus.h"

OperationStatus::OperationStatus(const Code& c)
	: m_code(c)
{

}

OperationStatus::OperationStatus(const std::string& str)
{
	m_code = m_conversionMap.at(str);
}

OperationStatus::Code OperationStatus::GetCode() const
{
	return m_code;
}

bool OperationStatus::operator!=(const OperationStatus& cmp)
{
    return m_code != cmp.m_code;
}

bool OperationStatus::operator==(const OperationStatus& cmp)
{
    return m_code == cmp.m_code;
}

bool OperationStatus::operator!=(const bool cmp)
{
    if (cmp)
        return m_code != Code::SUCCESS;
    return m_code == Code::SUCCESS;
}

OperationStatus& OperationStatus::operator=(const OperationStatus& opStatus)
{
	m_code = opStatus.m_code;
	return *this;
}

bool OperationStatus::operator==(const bool cmp)
{
    return !(*this != cmp);
}

OperationStatus::operator bool()
{
    return m_code == Code::SUCCESS;
}

OperationStatus::operator std::string()
{
	switch (m_code) {
	case Code::SUCCESS:
		return "Valid";
	case Code::F_BLANK:
		return "Blank";
	case Code::F_SIZE:
		return "Size";
	case Code::F_ALPHA_NUMERIC:
		return "AlphaNumeric";
	case Code::F_TRIM:
		return "Trim";
	case Code::DB_INVALID_ENTITY:
		return "InvalidEntity";
	case Code::DB_ENTITY_NOT_FOUND:
		return "EntityNotFound";
	case Code::DB_USER_INVALID_PASSWORD:
		return "InvalidUser";
	case Code::DB_INVALID_ID:
		return "InvalidId";
	default:
		return "Err";
	}
}