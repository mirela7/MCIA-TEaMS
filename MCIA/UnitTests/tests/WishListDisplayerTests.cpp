#include <gtest/gtest.h>
#include <WishListDisplayer.h>

TEST(WishListDisplayerTests, WishListDisplayerTest)
{
	WishListDisplayer wld(1, "title");
	EXPECT_EQ(wld.GetMovieId(), 1);
}

TEST(WishListDisplayerTests, WriteOperator)
{
	WishListDisplayer wld(1, "title");
	std::ostringstream sstr;
	sstr << wld;
	EXPECT_STREQ(sstr.str().c_str(), "1 title");
}

