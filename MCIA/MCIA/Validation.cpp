#include "Validation.h"

ValidationCode Validation::IsUsernameValid(const std::string& username)
{

    if (Validation::IsBlank(username))
        return ValidationCode(ValidationCode::Code::F_BLANK);
    if (isspace(username[0]) || isspace(username[username.size() - 1]))
        return ValidationCode(ValidationCode::Code::F_TRIM);
    if (username.size() < kMinUsernameLength)
        return ValidationCode(ValidationCode::Code::F_SIZE);
    if (!isalpha(username[0]) || !Validation::IsAlphaNumericOrSpecial(username))
        return ValidationCode(ValidationCode::Code::F_ALPHA_NUMERIC);
    return ValidationCode(ValidationCode::Code::VALID);
}


ValidationCode Validation::IsPasswordValid(const std::string& password)
{
    if (Validation::IsBlank(password))
        return ValidationCode(ValidationCode::Code::F_BLANK);
    if (password.size() < kMinPasswordLength)
        return ValidationCode(ValidationCode::Code::F_SIZE);
    return ValidationCode(ValidationCode::Code::VALID);
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


