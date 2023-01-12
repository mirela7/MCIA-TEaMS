#include <gtest/gtest.h>
#include <WishList.h>

TEST(WishListTests, WishListTests)
{
	WishList wishList(1, 2);
	EXPECT_EQ(wishList.GetUserId(), 1);
	EXPECT_EQ(wishList.GetMovieId(), 2);
}

TEST(WishListTests, SetterUserId)
{
	WishList wishList;
	wishList.SetUserId(1);
	EXPECT_EQ(wishList.GetUserId(), 1);
}

TEST(WishListTests, SetterMovieId)
{
	WishList wishList;
	wishList.SetMovieId(1);
	EXPECT_EQ(wishList.GetMovieId(), 1);
}
