#include <gtest/gtest.h>
#include <CodedException.h>

TEST(CodedExceptionTest, ConstructorCharChar) {
	CodedException e("cod", "mesaj");
	EXPECT_STREQ(e.what(), "[cod]mesaj");
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

TEST(CodedExceptionTest, GetterCode) {
	CodedException e("cod", "mesaj");
	EXPECT_STREQ(e.GetCode().c_str(), "cod");
}

TEST(CodedExceptionTest, GetterMessage) {
	CodedException e("cod", "mesaj");
	EXPECT_STREQ(e.GetMessage().c_str(), "mesaj");
}

TEST(CodedExceptionTest, GetterWhat) {
	CodedException e("cod", "mesaj");
	EXPECT_STREQ(e.GetWhat().c_str(), "[cod]mesaj");
}

TEST(CodedExceptionTest, What) {
	CodedException e("cod", "mesaj");
	EXPECT_STREQ(e.what(), "[cod]mesaj");
}