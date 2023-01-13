#include "../include/OperationStatusToMessage.h"

const std::map<OperationStatus::Code, std::string> OperationStatusToMessage::m_codeToMessage = {
		{OperationStatus::Code::F_BLANK,
			"Field % cannot be left blank."},
		{OperationStatus::Code::F_SIZE,
			"Field % must be longer than % characters."},
		{OperationStatus::Code::F_ALPHA_NUMERIC,
			"Field % must only contain %."},
		{OperationStatus::Code::F_TRIM,
			"Trailing whitespaces are not allowed in %."}
};

OperationStatusToMessage::OperationStatusToMessage()
{
}