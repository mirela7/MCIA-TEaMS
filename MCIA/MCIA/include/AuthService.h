#pragma once
#include <iostream>
#include <string>

/* Entities */
#include "User.h"
#include "Answer.h"
#include "Question.h"
#include "UserAnswerQuestion.h"
#include <fstream>

/* Others */
#include "DatabaseManagement.h"
#include "DBValidation.h"
#include "MovieInformationDisplayer.h"

class AuthService
{
public:
	static void RegisterUser(User& user);
	static void RegisterUserProcess(User& user);
	static void LoginUser(User& user);
	static void AuthenticateUser(User& user);
	static void LogOut();
	static bool ExistsUserWithUsername(const std::string& username);
	static int GetConnectedUserId();
	static std::string GetConnectedUserName();
	static void StartAuthProcess();

	const std::string FILE_NOT_OPENED = "[ResFileNotOpen] An error occured.Please try again later.";
	const std::string FOR_THE_MOVIE = "For the movie";
	const std::string PLEASE_ENETER_RATING = "Please enter the rating between 1 and 5: ";
	const std::string OUT_OF_RANGE = "Out of range rating.";
	const std::string ENTER_VALID = "Please enter a valid rating value: ";
	const std::string PLEASE_LOGIN = "Please login before entering the application.";
	const std::string PLEASE_RETRY = "Please retry:";

private:
	static std::unique_ptr<User> m_connectedUser;
};

