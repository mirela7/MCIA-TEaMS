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
		F_INVALID_PATTERN,

		DB_INVALID_ENTITY,
		DB_ENTITY_NOT_FOUND,

		DB_USER_INVALID_PASSWORD,
		DB_INVALID_ID
	};
public:
	OperationStatus(const Code& c);

	Code GetCode() const;
	
	static std::string CodeToString(const OperationStatus::Code& code);
	static OperationStatus::Code StringToCode(const std::string& str);

	bool operator!=(const OperationStatus& cmp);
	bool operator==(const OperationStatus& cmp);
	bool operator!=(const bool cmp);
	bool operator==(const bool cmp);

	OperationStatus& operator=(const OperationStatus& opStatus);
	operator bool();
	operator std::string();
	
private:
	Code m_code;
	static const std::unordered_map<std::string, Code> m_conversionMap;
};