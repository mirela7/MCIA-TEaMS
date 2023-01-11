#pragma once
#include <string>
#include <unordered_map>

class OperationStatus
{
public:
	enum Code : uint8_t {
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
	OperationStatus(const std::string& str);

	Code GetCode() const;

	bool operator!=(const OperationStatus& cmp);
	bool operator==(const OperationStatus& cmp);
	bool operator!=(const bool cmp);
	bool operator==(const bool cmp);

	OperationStatus& operator=(const OperationStatus& opStatus);
	operator bool();
	operator std::string();
	
private:
	Code m_code;
	const std::unordered_map<std::string, Code> m_conversionMap{
		{"Valid", Code::SUCCESS}
		, { "Blank", Code::F_BLANK}
		, { "Size", Code::F_SIZE }
		, { "AlphaNumeric", Code::F_ALPHA_NUMERIC} 
		, { "Trim", Code::F_TRIM } 
		, { "InvalidEntity", Code::DB_INVALID_ENTITY }
		, { "EntityNotFound", Code::DB_ENTITY_NOT_FOUND }
		, { "InvalidUser", Code::DB_USER_INVALID_PASSWORD }
		, { "InvalidId", Code::DB_INVALID_ID } 
	};
};