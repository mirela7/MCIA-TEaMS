#pragma once
#include <string>

class OperationStatus
{
public:
	enum Code {
		SUCCESS,
		
		F_BLANK,
		F_SIZE,
		F_ALPHA_NUMERIC,
		F_TRIM,

		DB_INVALID_ENTITY,
		DB_ENTITY_NOT_FOUND,

		DB_USER_INVALID_PASSWORD,
		DB_INVALID_ID
	};
public:
	OperationStatus(const Code& c);

	bool operator!=(const OperationStatus& cmp);
	bool operator==(const OperationStatus& cmp);
	bool operator!=(const bool cmp);
	bool operator==(const bool cmp);
	operator bool();
	operator std::string();
private:
	Code m_code;
};

