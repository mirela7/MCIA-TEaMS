#include <gtest/gtest.h>
#include <CodedException.h>

TEST(CodedExceptionTest, ConstructorCharChar) {
	CodedException e("cod", "mesaj");
	EXPECT_STREQ(std::string(e.GetWhat()).c_str(), "[cod]mesaj");
}

TEST(CodedExceptionTest, ConstructorOpStatusString) {
	CodedException e(OperationStatus::F_SIZE, "mesaj");
	EXPECT_STREQ(std::string(e.GetWhat()).c_str(), "[Size]mesaj");
}

TEST(CodedExceptionTest, ConstructorStringString) {
	std::string cod = "cod";
	std::string mesaj = "mesaj";
	CodedException e(cod, mesaj);
	EXPECT_STREQ(std::string(e.GetWhat()).c_str(), "[cod]mesaj");
}