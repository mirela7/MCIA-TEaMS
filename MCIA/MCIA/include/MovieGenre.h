#pragma once
#include <cstdint>

class MovieGenre
{
public:
	MovieGenre(const uint16_t movieId, const uint16_t genreId);

	uint16_t GetMovieId() const;
	uint16_t GetGenreId() const;

	void SetMovieId(const uint16_t movieId);
	void SetGenreId(const uint16_t genreId);

private:
	uint16_t m_movieId;
	uint16_t m_genreId;
};

