#include <gtest/gtest.h>
#include <DBValidation.h>

// Demonstrate some basic assertions.
TEST(HelloTest, BasicAssertions) {
	// Expect two strings not to be equal.
	EXPECT_STRNE("hello", "world");
	// Expect equality.
	EXPECT_EQ(7 * 6, 42);

}

// Demonstrate some basic assertions.
TEST(HelloTest2, BasicAssertionsT2) {
	// Expect two strings not to be equal.
	EXPECT_STRNE("hello", "world");
	// Expect equality.
	EXPECT_EQ(7 * 6, 42);

	DBValidation validator;
	validator.IsUsernameValid("ana");
}

