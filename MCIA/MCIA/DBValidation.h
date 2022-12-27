#pragma once
#include <string>	
#include <iostream>
#include "OperationStatus.h"
#include "DatabaseManagement.h"
#include "..\Validation\Validator.h"
#include "OperationStatusToMessage.h"


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
	Validator m_validator;
	OperationStatusToMessage m_statusToMessage;
	static const int kMinUsernameLength = 3;
	static const int kMinPasswordLength = 3;
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
