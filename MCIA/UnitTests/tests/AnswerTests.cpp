#include <gtest/gtest.h>
#include <Answer.h>

TEST(AnswerTests, Constructor3) {
	Answer answer(1, 3, "rasp");
	EXPECT_EQ(answer.GetId(), 1);
	EXPECT_EQ(answer.GetQuestionID(), 3);
	EXPECT_STREQ(answer.GetAnswer().c_str(), "rasp");
}

TEST(AnswerTests, SetterId) {
	Answer answer;
	answer.SetId(1);
	EXPECT_EQ(answer.GetId(), 1);
}

TEST(AnswerTests, SetterQuestionId) {
	Answer answer;
	answer.SetQuestionId(1);
	EXPECT_EQ(answer.GetQuestionID(), 1);
}

TEST(AnswerTests, SetterAnswer) {
	Answer answer;
	answer.SetAnswear("raspuns");
	EXPECT_STREQ(answer.GetAnswer().c_str(), "raspuns");
}