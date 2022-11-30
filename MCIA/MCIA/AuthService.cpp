#include "AuthService.h"
#include <regex>
#include <sstream>

User* AuthService::m_connectedUser = nullptr;


void AuthService::RegisterUser(User& user)
{
	OperationStatus username_valid = Validation::IsUsernameValid(user.GetName());
	OperationStatus pw_valid = Validation::IsPasswordValid(user.GetPassword());
	if (!username_valid)
		throw CodedException(username_valid, "Invalid name.");
	if(!pw_valid)
		throw CodedException(pw_valid, "Invalid password.");
	int insertedUserId = DatabaseManagement::GetInstance().InsertElement(user);
	m_connectedUser = new User(user);
	m_connectedUser->SetId(insertedUserId);
	
	std::cout << "Welcome " << user.GetName() << " please answer some questions first: \n\n";
    auto question = DatabaseManagement::GetInstance().GetStorage().get_all<Question>();

	for (uint16_t index = 0; index < question.size(); index++)
	{
		std::cout << "Question number " << index+1 << ":\n";
		std::cout << question[index].GetQuestion() << "\n\n";
		auto answer = DatabaseManagement::GetInstance().GetStorage().get_all<Answer>(where(c(&Answer::GetQuestionID) == question[index].GetId()));
		for (uint16_t index2 = 0; index2 < answer.size(); index2++)
			std::cout << "[" << index2 << "]" << answer[index2].GetAnswer() << '\n';
		std::cout << '\n';

		if (question[index].GetChoice())
		{
			std::cout << "Please enter a string with the numbers of the genres you like separated by a space\n";

			while (true)
			{
				std::string options;
				std::getline(std::cin >> std::ws, options);

				std::regex integer_expr("([0-9]+(\ ))*[0-9]+");
				bool ok = false;
				if (std::regex_match(options, integer_expr))
				{
					std::istringstream iss(options);
					uint16_t val;
					std::vector<uint16_t> values;
					while(iss>>val)
					{	
						if (val >= 0 && val < answer.size())
						{
							values.push_back(val);
						}
						else
						{
							std::cout << "The text you have dialed is not good, please retry: ";
							ok = true;
							break;
						}
					}
					if(!ok)
					for (const auto& it : values)
					{
						UserAnswerQuestion element(m_connectedUser->GetId(), answer[it].GetId(), question[index].GetId());
						DatabaseManagement::GetInstance().GetStorage().replace(element);
					}
				}
				else
				{
					std::cout << "The text you have dialed is not good, please retry: ";
					ok = true;
				}
				if (!ok)
					break;
			}
		}
		else
		{
			std::cout << "Please choose one option:\n";
			std::string soption;
			uint16_t option;
			while (true)
			{
					std::cin >> soption;
					try {
						option = std::stoi(soption);
						if (option >= 0 && option < answer.size())
						{
							break;
						}
						else
						{
							std::cout << "Invalid option please retry\n\nEnter your option: ";
						}
					}
					catch (std::invalid_argument e)
					{
						std::cout << "Invalid option please retry\n\nEnter your option: ";
					}
			}
			
			UserAnswerQuestion element(m_connectedUser->GetId(), answer[option].GetId(), question[index].GetId());
			DatabaseManagement::GetInstance().GetStorage().replace(element);
		}
		
	}
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

void AuthService::LogOut()
{
	delete m_connectedUser;
	StartAuthProcess();
}

User AuthService::GetConnectedUser()
{
	return *m_connectedUser;
}
