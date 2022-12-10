#pragma once
#include <string>	
#include <iostream>
#include "OperationStatus.h"
#include "DatabaseManagement.h"
#include "..\Validation\Validator.h"


class Validation
{
public:
	OperationStatus IsUsernameValid(const std::string& username);
	OperationStatus IsPasswordValid(const std::string& password);
	template <class T> 
	static uint16_t IdExists(const std::string& id);

private:
	Validator m_validator;
	static const int kMinUsernameLength = 3;
	static const int kMinPasswordLength = 3;
};

template<class T>
inline uint16_t Validation::IdExists(const std::string& id)
{
	int conv_id;
	auto& st = DatabaseManagement::GetInstance().GetStorage();

	try
	{
		size_t maximumIdLenght = 5;
		if (id.size() <= maximumIdLenght)
		{
			conv_id = std::stoi(id);
			auto search_movies = st.get_all<T>(where(c(&T::GetId) == id));
			if (!search_movies.size())
			{
				throw CodedException(OperationStatus::DB_INVALID_ID, "The id does not exist");
			}
		}
		else
		{
			throw CodedException(OperationStatus::DB_INVALID_ID, "The id does not exist");
		}
	}
	catch (CodedException e)
	{
		std::cout << "Please enter a valid id: ";
		return 0;
	}
	catch (std::invalid_argument e)
	{
		std::cout << "Please enter a valid id: ";
		return 0;
	}
	return conv_id;
}
