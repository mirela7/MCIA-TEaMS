#pragma once
#include <string>

class ValidationCode
{
public:
	enum class Code {
		VALID,
		F_BLANK,
		F_SIZE,
		F_ALPHA_NUMERIC,
		F_TRIM
	};
public:
	ValidationCode(const Code& c);

	bool operator!=(const ValidationCode& cmp);
	bool operator==(const ValidationCode& cmp);
	bool operator!=(const bool cmp);
	bool operator==(const bool cmp);
	operator bool();
	operator std::string();
private:
	Code m_code;
};

