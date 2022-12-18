#include <string>
#include <map>
#include "OperationStatus.h"

class OperationStatusToMessage {
public:
	OperationStatusToMessage();
	
	template<typename... Args>
	std::string GetMessage(OperationStatus::Code code, Args... args);

private:
	template<typename T, typename... Args>
	std::string GetMessageFromBase(const std::string& base, T value, Args... args);

	template<typename T, typename... Args>
	std::string GetMessageFromBase(const std::string& base, T last);

private:
	std::map<OperationStatus::Code, std::string> m_codeToMessage;
};

template<typename ...Args>
inline std::string OperationStatusToMessage::GetMessage(OperationStatus::Code code, Args ...args)
{
	std::string baseString = m_codeToMessage.at(code);
	return GetMessageFromBase(baseString, args...);
}

template<typename T, typename ...Args>
std::string OperationStatusToMessage::GetMessageFromBase(const std::string& base, T value, Args ...args)
{
	int posOfMod = base.find_first_of("%");
	if (posOfMod == -1)
		return base;
	base.erase(posOfMod, 1);
	base.insert(posOfMod, std::string(value));
	return GetMessageFromBase(base, args...);
}

template<typename T, typename ...Args>
std::string OperationStatusToMessage::GetMessageFromBase(const std::string& base, T last) {
	int posOfMod = base.find_first_of("%");
	if (posOfMod == -1)
		return base;
	base.erase(posOfMod, 1);
	base.insert(posOfMod, std::string(last));
	return base;
}