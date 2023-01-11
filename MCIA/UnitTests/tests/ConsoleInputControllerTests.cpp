#include <gtest/gtest.h>
#include <ConsoleInputController.h>
#include <sstream>

TEST(ConsoleInputControllerTest, GatherMovieIdSpecializedSizeInpage) {
	std::vector<Movie> moviesInPage;
	moviesInPage.emplace_back(1, "TestTitle", 2000, 5.0);
	ConsoleInputController cic;

	/* expects invalidId due to size, read the next id that exists in page & in db */
	std::string userInput("12345678910 1 2");
	std::string expectedOutput;
	expectedOutput.append(cic.OUT_PICK_ID);
	expectedOutput.append(cic.OUT_ASK_VALID_ID);

	std::istringstream inputStream(userInput);
	std::ostringstream outputStream;
	
	int validId = cic.gatherMovieIdFromUser(moviesInPage, outputStream, inputStream);
	EXPECT_EQ(validId, 1);
	EXPECT_STREQ(outputStream.str().c_str(), expectedOutput.c_str());
}