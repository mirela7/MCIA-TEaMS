#pragma once
#include <string>	
#include <iostream>
#include "OperationStatus.h"
#include "CodedException.h"
#include "DatabaseManagement.h"
#include "OperationStatus.h"
#include "Movie.h"
#include "User.h"


class Validation
{
public:
	static OperationStatus IsUsernameValid(const std::string& username);
	static OperationStatus IsPasswordValid(const std::string& password);
	static bool IsAlphaNumericOrSpecial(const std::string& string);
	static bool IsBlank(const std::string& string);
	static bool IsNotBlank(const char c);
	template <class T> 
	static uint16_t IdExists(T cl, const std::string& id);
public:

private:
	Validation() = default;

	static bool IsNotAlphaNumericOrSpecial(const char c);

private:
	static const int kMinUsernameLength = 3;
	static const int kMinPasswordLength = 3;
};

template<class T>
inline uint16_t Validation::IdExists(T element,const std::string& id)
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
		std::cout << e.what() << "\n\n";
		std::cout << "Please enter a valid id: ";
		return 0;
	}
	return conv_id;
}
