#pragma once
#include <cstdint>
class WishList
{
public:
	WishList() = default;
	WishList(const uint16_t user_id, const uint16_t movie_id);

	uint16_t GetUserId() const;
	uint16_t GetMovieId() const;

	void SetUserId(const uint16_t user_id);
	void SetMovieId(const uint16_t movie_id);

private:
	uint16_t m_user_id;
	uint16_t m_movie_id;
};

