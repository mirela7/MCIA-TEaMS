#pragma once
#include <iostream>
#include <iomanip>
#include <cstdint>

class WishListDisplayer
{
public:
	WishListDisplayer(uint32_t mvId, const std::string& mvTitle);

	uint32_t GetMovieId() const;

	friend std::ostream& operator<<(std::ostream& g, WishListDisplayer wld);
private:
	uint32_t m_movieId;
	std::string m_movieTitle;
};
