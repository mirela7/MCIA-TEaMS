#include <gtest/gtest.h>
#include <DBValidation.h>

TEST(UserTests, Constructor3) {
	User user(1, "nume", "parola");
	EXPECT_EQ(user.GetId(), 1);
	EXPECT_STREQ(user.GetName().c_str(), "nume");
	EXPECT_STREQ(user.GetPassword().c_str(), "parola");
}

TEST(UserTests, ConstructorCopy) {
	User user(1, "nume", "parola");
	User cpy(user);
	EXPECT_EQ(cpy.GetId(), 1);
	EXPECT_STREQ(cpy.GetName().c_str(), "nume");
	EXPECT_STREQ(cpy.GetPassword().c_str(), "parola");
}

TEST(UserTests, ConstructorNoId) {
	User user("nume", "parola");
	EXPECT_EQ(user.GetId(), 0);
	EXPECT_STREQ(user.GetName().c_str(), "nume");
	EXPECT_STREQ(user.GetPassword().c_str(), "parola");
}

