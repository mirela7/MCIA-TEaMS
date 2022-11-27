#pragma once
#include <iostream>
#include <string>
#include<string.h>
#include "User.h"
#include "Answer.h""
#include "Question.h"
#include "UserAnswerQuestion.h"
#include "DatabaseManagement.h"
#include "Validation.h"

class AuthService
{
public:

	static void RegisterUser(User& user);
	static void LoginUser(User& user);
	static void AuthenticateUser(User& user);
	static void LogOut();
	static User GetConnectedUser();

	static User StartAuthProcess();

private:
	static User* m_connectedUser;
};

