#include "Validator.h"

bool Validator::IsAlphaNumericOrSpecial(const std::string& string)
{
    return find_if(string.begin(), string.end(), IsNotAlphaNumericOrSpecial) == string.end();
}

bool Validator::IsBlank(const std::string& string)
{
    return string.size() == 0 || find_if(string.begin(), string.end(), IsNotBlank) == string.end();
}

bool Validator::IsNotBlank(const char c)
{
    return !isblank(c);
}

bool Validator::IsNotAlphaNumericOrSpecial(const char c)
{
    return !(isalnum(c) || c == '_' || c == '.');
}
