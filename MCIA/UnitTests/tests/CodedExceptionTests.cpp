#include <gtest/gtest.h>
#include <CodedException.h>

TEST(CodedExceptionTest, ConstructorCharChar) {
	CodedException e("Valid", "mesaj");
	EXPECT_STREQ(e.what(), "[Valid]mesaj");
}

TEST(CodedExceptionTest, ConstructorOpStatusString) {
	CodedException e(OperationStatus::F_SIZE, "mesaj");
	EXPECT_STREQ(std::string(e.GetWhat()).c_str(), "[Size]mesaj");
}

TEST(CodedExceptionTest, GetterCode) {
	CodedException e(OperationStatus::F_SIZE, "mesaj");
	EXPECT_EQ(e.GetCode(), OperationStatus::F_SIZE);
}

TEST(CodedExceptionTest, GetterMessage) {
	CodedException e(OperationStatus::F_SIZE, "mesaj");
	EXPECT_STREQ(e.GetMessage().c_str(), "mesaj");
}

TEST(CodedExceptionTest, GetterWhat) {
	CodedException e("Valid", "mesaj");
	EXPECT_STREQ(e.GetWhat().c_str(), "[Valid]mesaj");
}

TEST(CodedExceptionTest, What) {
	CodedException e("Valid", "mesaj");
	EXPECT_STREQ(e.what(), "[Valid]mesaj");
}