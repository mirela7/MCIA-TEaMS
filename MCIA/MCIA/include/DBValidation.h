#pragma once
#include <string>	
#include <iostream>
#include "OperationStatus.h"
#include "DatabaseManagement.h"
#include "OperationStatusToMessage.h"
#include <Validator.h>

class DBValidation
{
public:
	OperationStatus IsUsernameValid(const std::string& username);
	std::string UsernameErrorMessage(OperationStatus status);
	OperationStatus IsPasswordValid(const std::string& password);
	std::string PasswordErrorMessage(OperationStatus status);

	template <class T> 
	OperationStatus IdExists(const int id);

private:
	static const int kMinUsernameLength = 3;
	static const int kMinPasswordLength = 3;
private:
	Validator m_validator;
	OperationStatusToMessage m_statusToMessage;
};

template<class T>
inline OperationStatus DBValidation::IdExists(const int id)
{
	auto& st = DatabaseManagement::GetInstance().GetStorage();
	auto search_element = st.get_all<T>(where(c(&T::GetId) == id));
	if (!search_element.size())
		return OperationStatus::DB_INVALID_ID;
	return OperationStatus::SUCCESS;
}

