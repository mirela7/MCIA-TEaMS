#include "../include/AuthService.h"
#include <sstream>

std::unique_ptr<User> AuthService::m_connectedUser = nullptr;


void AuthService::RegisterUser(User& user)
{
	DBValidation validate;
	OperationStatus username_valid = validate.IsUsernameValid(user.GetName());
	OperationStatus pw_valid = validate.IsPasswordValid(user.GetPassword());
	if (!username_valid)
		throw CodedException(username_valid.GetCode(), "username");
	if (!pw_valid)
		throw CodedException(pw_valid.GetCode(), "password");
	if (ExistsUserWithUsername(user.GetName()))
		throw CodedException("username", "A user with this username already exists.");
	int insertedUserId = DatabaseManagement::GetInstance().InsertElement(user);
	m_connectedUser = std::make_unique<User>(user);
	m_connectedUser->SetId(insertedUserId);
}

void AuthService::RegisterUserProcess(User& user)
{
	RegisterUser(user);
	std::cout << "Welcome " << user.GetName() << " please rate some movies first: \n\n";
	std::ifstream f("Questions.txt");
	uint32_t id_movie;
	std::string genre, srating;
	float rating;
	
		while (f >> id_movie && f >> genre)
		{
			auto movie = DatabaseManagement::GetInstance().GetStorage().get_all<Movie>(where(c(&Movie::GetId) == id_movie));
			std::cout << "For the movie\n";
			std::cout << movie[0].GetTitle() << " with the most relevant genres: " << genre <<"\n";
			std::cout << "Please enter the rating between 1 and 5: \n";
			//This checks if the rating for the movie to add in watched list table is valid or out of range.
			while (true)
			{
				std::cin >> srating;
				try
				{
					size_t maximumRatingValueLenght = 3;
					if (srating.size() <= maximumRatingValueLenght)
					{
						rating = std::stof(srating);
						if (rating < 1.0f || rating > 5.0f)
						{
							std::cout << "\nOut of range rating.\n";
							std::cout << "Please enter a valid rating value: \n";
						}
						else
							break;
					}
					else
					{
						std::cout << "\nOut of range rating.\n";
						std::cout << "Please enter a valid rating value: ";
					}
				}
				catch (std::invalid_argument e)
				{
					std::cout << "\nOut of range rating.\n";
					std::cout << "Please enter a valid rating value: ";
				}
			}

			WatchedMovie watchedMovie(m_connectedUser->GetId(),id_movie, rating);// (static_cast<uint16_t>(user_id), static_cast<uint16_t>(movie_id), static_cast<uint8_t>(rating));
			try {
				DatabaseManagement::GetInstance().GetStorage().replace(watchedMovie);
			}
			catch (std::exception e) {
				std::cout << e.what();
			}

		}
}

void AuthService::LoginUser(User& user)
{
	if (user.GetPassword() != DatabaseManagement::GetInstance().GetElementByColumnValue(&User::GetName, user.GetName()).GetPassword())
		throw CodedException(OperationStatus::Code::DB_USER_INVALID_PASSWORD, "Incorrect password.");
	m_connectedUser = std::make_unique<User>(DatabaseManagement::GetInstance().GetElementByColumnValue(&User::GetName, user.GetName()));
}

void AuthService::StartAuthProcess()
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
				AuthService::RegisterUserProcess(user);
			else
				AuthService::LoginUser(user);
			break;
		}
		catch (CodedException e) {
			std::cout << e.what() << "\n\n";
		}
		catch (std::exception e) {
			std::cout << e.what() << "\n\n";
		}
	}
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
	else RegisterUserProcess(user);
}

void AuthService::LogOut()
{
	m_connectedUser.release();
	StartAuthProcess();
}	

int AuthService::GetConnectedUserId() // TODO: throw exception if user isnt connected
{
	return m_connectedUser->GetId();
}

std::string AuthService::GetConnectedUserName()
{
	return m_connectedUser->GetName();
}