#include <gtest/gtest.h>
#include <DBValidation.h>

TEST(DBValidationTests, UsernameBlank) {
	DBValidation validator;
	std::string username("      ");
	OperationStatus result = validator.IsUsernameValid(username);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_BLANK);
}

TEST(DBValidationTests, UsernameNotTrimmed) {
	DBValidation validator;
	std::string username("  username  ");
	OperationStatus result = validator.IsUsernameValid(username);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_TRIM);
}

TEST(DBValidationTests, UsernameSize) {
	DBValidation validator;
	std::string username("a");
	OperationStatus result = validator.IsUsernameValid(username);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_SIZE);
}

TEST(DBValidationTests, UsernameAlphaNumeric) {
	DBValidation validator;
	std::string username("_aaa");
	OperationStatus result = validator.IsUsernameValid(username);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_ALPHA_NUMERIC);
	username = "a;$";
	result = validator.IsUsernameValid(username);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_ALPHA_NUMERIC);
}

TEST(DBValidationTests, UsernameValid) {
	DBValidation validator;
	std::string username("userna13e_");
	OperationStatus result = validator.IsUsernameValid(username);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::SUCCESS);
}

TEST(DBValidationTests, PasswordBlank) {
	DBValidation validator;
	std::string password("      ");
	OperationStatus result = validator.IsPasswordValid(password);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_BLANK);
}

TEST(DBValidationTests, PasswordSize) {
	DBValidation validator;
	std::string password("12");
	OperationStatus result = validator.IsPasswordValid(password);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::F_SIZE);
}

TEST(DBValidationTests, PasswordValid) {
	DBValidation validator;
	std::string password("parola");
	OperationStatus result = validator.IsPasswordValid(password);
	EXPECT_EQ(result.GetCode(), OperationStatus::Code::SUCCESS);
}