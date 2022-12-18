#include "DBValidation.h"
OperationStatus DBValidation::IsUsernameValid(const std::string& username)
{

    if (m_validator.IsBlank(username))
        return OperationStatus(OperationStatus::Code::F_BLANK);
    if (isspace(username[0]) || isspace(username[username.size() - 1]))
        return OperationStatus(OperationStatus::Code::F_TRIM);
    if (username.size() < kMinUsernameLength)
        return OperationStatus(OperationStatus::Code::F_SIZE);
    if (!isalpha(username[0]) || !m_validator.IsAlphaNumericOrSpecial(username))
        return OperationStatus(OperationStatus::Code::F_ALPHA_NUMERIC);
    return OperationStatus(OperationStatus::Code::SUCCESS);
}


OperationStatus DBValidation::IsPasswordValid(const std::string& password)
{
    if (m_validator.IsBlank(password))
        return OperationStatus(OperationStatus::Code::F_BLANK);
    if (password.size() < kMinPasswordLength)
        return OperationStatus(OperationStatus::Code::F_SIZE);
    return OperationStatus(OperationStatus::Code::SUCCESS);
}
