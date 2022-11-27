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
	
	auto validUser= DatabaseManagement::GetInstance().GetStorage().get_all<User>(where(c(&User::GetName)==user.GetName()));

	/* 
	TODO: Quizz questions 
		- select questions & answers (+ display them -> handle exceptions)
			+ add Code in OperationStatus::Code
		- save answers to db
	*/

	std::cout << "Welcome " << user.GetName() << " please answer some questions first: \n\n";
    auto question = DatabaseManagement::GetInstance().GetStorage().get_all<Question>();

	for (uint16_t index = 0; index < question.size(); index++)
	{
		std::cout << "Question number " << index+1 << ":\n";
		std::cout << question[index].GetQuestion() << "\n\n";
		auto answer = DatabaseManagement::GetInstance().GetStorage().get_all<Answer>(where(c(&Answer::GetQuestionID) == index+1));
		for (uint16_t index2 = 0; index2 < answer.size(); index2++)
			std::cout << "[" << index2 << "]" << answer[index2].GetAnswer() << '\n';
		std::cout << '\n';

		if (question[index].GetChoice())
		{
			std::cout << "Please enter a string with the numbers of the genres you like separated by a space\n";
			std::string options;
			std::getline(std::cin>>std::ws,options); 

			//TODO: verify if string is good function
			for (int index3 = 0; index3 < options.size(); index3=index3+2)
			{
				UserAnswerQuestion element(validUser[0].GetId(), answer[options[index3] - '0'].GetId(), index + 1);
				DatabaseManagement::GetInstance().GetStorage().replace(element);
			}
		}
		else
		{
			std::cout << "Please choose one option:\n";
			uint16_t option;
			std::cin >> option;

			//TODO: verify option
			UserAnswerQuestion element(validUser[0].GetId(), answer[option].GetId(), index);
			DatabaseManagement::GetInstance().GetStorage().replace(element);
		}
		
	}

	

	m_connectedUser = new User(user);
}

void AuthService::LoginUser(User& user)
{
	if (user.GetPassword() != DatabaseManagement::GetInstance().GetElementByColumnValue(&User::GetName, user.GetName()).GetPassword())
		throw CodedException(OperationStatus::Code::DB_USER_INVALID_PASSWORD, "Incorrect password.");

	m_connectedUser = new User(DatabaseManagement::GetInstance().GetElementByColumnValue(&User::GetName, user.GetName()));
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
