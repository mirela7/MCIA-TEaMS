#pragma once
#include <iostream>
#include <string>

/* Entities */
#include "User.h"
#include "Answer.h""
#include "Question.h"
#include "UserAnswerQuestion.h"

/* Others */
#include "DatabaseManagement.h"
#include "Validation.h"

class AuthService
{
public:
	static void RegisterUser(User& user);
	static void RegisterUserProcess(User& user);
	static void LoginUser(User& user);
	static void AuthenticateUser(User& user);
	static void LogOut();
	static bool ExistsUserWithUsername(const std::string& username);
	static User GetConnectedUser();
	static User StartAuthProcess();

private:
	static User* m_connectedUser;
};

