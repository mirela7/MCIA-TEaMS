#include "ValidationCode.h"

ValidationCode::ValidationCode(const Code& c)
	: m_code(c)
{
}

bool ValidationCode::operator!=(const ValidationCode& cmp)
{
    return m_code != cmp.m_code;
}

bool ValidationCode::operator==(const ValidationCode& cmp)
{
    return m_code == cmp.m_code;
}

bool ValidationCode::operator!=(const bool cmp)
{
    if (cmp)
        return m_code != Code::VALID;
    return m_code == Code::VALID;
}

bool ValidationCode::operator==(const bool cmp)
{
    return !(*this != cmp);
}

ValidationCode::operator bool()
{
    return m_code == Code::VALID;
}

ValidationCode::operator std::string()
{
	switch (m_code) {
	case Code::VALID:
		return "Valid";
	case Code::F_BLANK:
		return "Blank";
	case Code::F_SIZE:
		return "Size";
	case Code::F_ALPHA_NUMERIC:
		return "AlphaNumeric";
	case Code::F_TRIM:
		return "Trim";
	default:
		return "Err";
	}
}
