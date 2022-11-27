#include "Validation.h"

OperationStatus Validation::IsUsernameValid(const std::string& username)
{

    if (Validation::IsBlank(username))
        return OperationStatus(OperationStatus::Code::F_BLANK);
    if (isspace(username[0]) || isspace(username[username.size() - 1]))
        return OperationStatus(OperationStatus::Code::F_TRIM);
    if (username.size() < kMinUsernameLength)
        return OperationStatus(OperationStatus::Code::F_SIZE);
    if (!isalpha(username[0]) || !Validation::IsAlphaNumericOrSpecial(username))
        return OperationStatus(OperationStatus::Code::F_ALPHA_NUMERIC);
    return OperationStatus(OperationStatus::Code::SUCCESS);
}


OperationStatus Validation::IsPasswordValid(const std::string& password)
{
    if (Validation::IsBlank(password))
        return OperationStatus(OperationStatus::Code::F_BLANK);
    if (password.size() < kMinPasswordLength)
        return OperationStatus(OperationStatus::Code::F_SIZE);
    return OperationStatus(OperationStatus::Code::SUCCESS);
}

bool Validation::IsAlphaNumericOrSpecial(const std::string& string)
{
    return find_if(string.begin(), string.end(), Validation::IsNotAlphaNumericOrSpecial) == string.end();
}

bool Validation::IsBlank(const std::string& string)
{
    return string.size() == 0 || find_if(string.begin(), string.end(), Validation::IsNotBlank) == string.end();
}

bool Validation::IsNotBlank(const char c)
{
    return !isblank(c);
}

bool Validation::IsNotAlphaNumericOrSpecial(const char c)
{
    return !(isalnum(c) || c == '_' || c == '.');
}
