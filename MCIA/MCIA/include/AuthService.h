#pragma once
#include <iostream>
#include <string>
#include <fstream>

#include "User.h"
#include "DatabaseManagement.h"
#include "DBValidation.h"
#include "MovieInformationDisplayer.h"

class AuthService
{
public:
	void RegisterUser(User& user);
	void RegisterUserProcess(User& user);
	void LoginUser(User& user);
	void LogOut();
	bool ExistsUserWithUsername(const std::string& username);
	static int GetConnectedUserId();
	static std::string GetConnectedUserName();
	void StartAuthProcess();

protected:
	const std::string PATH_QUESTIONS_FILE = "..\\..\\..\\MCIA\\src\\Questions.txt";
	const std::string FILE_NOT_OPENED = "[ResFileNotOpen] An error occured.Please try again later.";
	const std::string PLEASE_ENTER_RATING = "Please enter the rating between 1 and 5: ";
	const std::string OUT_OF_RANGE_RATING = "Out of range rating.\nPlease enter a valid rating value: ";
	const std::string PLEASE_LOGIN = "Please login before entering the application.\n";
	const std::string PLEASE_RETRY = "\n\nPlease retry:\n";

private:
	static std::unique_ptr<User> m_connectedUser;
};

