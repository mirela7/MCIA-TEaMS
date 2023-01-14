#pragma once
#include <iostream>
#include <string>
#include <fstream>

#include "User.h"
#include "DatabaseManagement.h"
#include "DBValidation.h"

class AuthService
{
public:
	static void RegisterUser(User& user);
	static void RegisterUserProcess(User& user);
	static void LoginUser(User& user);
	static void LogOut();
	static bool ExistsUserWithUsername(const std::string& username);
	static int GetConnectedUserId();
	static std::string GetConnectedUserName();
	static void StartAuthProcess();
    static std::vector<uint16_t> GetRecommendedMoviesForCurrentUser();
    static void UpdateRecomMoviesForCurrentUser(uint32_t movieId, float rating);
private:
	static std::unique_ptr<User> m_connectedUser;
};

