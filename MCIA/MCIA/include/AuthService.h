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

private:
	static std::unique_ptr<User> m_connectedUser;
};

