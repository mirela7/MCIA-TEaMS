#include "AuthService.h"

User* AuthService::m_connectedUser = nullptr;


void AuthService::RegisterUser(User& user)
{
	OperationStatus username_valid = Validation::IsUsernameValid(user.GetName());
	OperationStatus pw_valid = Validation::IsPasswordValid(user.GetPassword());
	if (!username_valid)
		throw CodedException(username_valid, "Invalid name.");
	if(!pw_valid)
		throw CodedException(username_valid, "Invalid password.");
	DatabaseManagement::GetInstance().InsertElement(user);

	/* 
	TODO: Quizz questions 
		- select questions & answers (+ display them -> handle exceptions)
			+ add Code in OperationStatus::Code
		- save answers to db
	*/

	m_connectedUser = new User(user);
}

void AuthService::LoginUser(User& user)
{
	if (user.GetPassword() != DatabaseManagement::GetInstance().GetUserByName(user.GetName()).GetPassword())
		throw CodedException(OperationStatus::Code::DB_USER_INVALID_PASSWORD, "Incorrect password.");

	m_connectedUser = new User(DatabaseManagement::GetInstance().GetUserByName(user.GetName()));
}

User AuthService::StartAuthProcess()
{
	char c;
	bool isRegistering = false;
	std::string name, pw;
	auto& dbm = DatabaseManagement::GetInstance();

	std::cout << "Please login before entering the application.\n";

	while (true)
	{
		std::cout << "Username: ";
		std::cin >> name;
		std::cout << "Password: ";
		std::cin >> pw;

		User user(name, pw);
		isRegistering = false;

		if (!ExistsUserWithUsername(name))
		{
			std::cout << "There is no account with username " + name + ":\n [r] register       [x] back to login\nPlease choose: ";
			std::cin >> c;
			if (c == 'x')
				continue;
			isRegistering = true;
		}
		try {
			if (isRegistering)
				AuthService::RegisterUser(user);
			else
				AuthService::LoginUser(user);
			break;
		}
		catch (CodedException e) {
			std::cout << e.what() << "\n\n";
		}
	}
	
	return AuthService::GetConnectedUser();
}

bool AuthService::ExistsUserWithUsername(const std::string& username)
{
	auto result = DatabaseManagement::GetInstance().GetStorage().get_all<User>(where(c(&User::GetName) == username));
	return !(result.empty());
}

void AuthService::AuthenticateUser(User& user)
{
	if (ExistsUserWithUsername(user.GetName()))
		LoginUser(user);
	else RegisterUser(user);
}

User AuthService::GetConnectedUser()
{
	return *m_connectedUser;
}
