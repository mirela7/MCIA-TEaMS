#pragma once
#include <cstdint>

class WatchedMovie {
public:
	WatchedMovie() = default;
	WatchedMovie(const uint16_t user_id, const uint16_t movie_id, const uint8_t rating);

	uint16_t GetUserId() const;
	uint16_t GetMovieId() const;
	uint8_t GetRating() const;

	void SetUserId(const uint16_t user_id);
	void SetMovieId(const uint16_t movie_id);
	void SetRating(const uint8_t rating);

private:
	uint16_t m_user_id;
	uint16_t m_movie_id;
	uint8_t m_rating; // < this is int atm
};