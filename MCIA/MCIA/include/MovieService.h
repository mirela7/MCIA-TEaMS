#pragma once
#include "DBPage.h"
#include "DatabaseManagement.h"
#include "WatchedMovieDisplayer.h"
#include "WishlistedMovieDisplayer.h"
#include "MovieInformationDisplayer.h"

class MovieService {
public:	
	DBPage<WatchedMovieDisplayer> GetWatchedMoviesOfUser(const uint32_t userId, const int page, const int nmbRowsPerPage);
	DBPage<WishlistedMovieDisplayer> GetWishListOfUser(const uint32_t userId, const int page, const int nmbRowsPerPage);
	MovieInformationDisplayer GetMovieInformations(const uint32_t id);
	void AddMovieToWatchlist(const uint32_t userId, const uint32_t movieId, const float rating);
	void RemoveMovieFromWatchlist(const uint32_t userId, const uint32_t movieId);
	void AddMovieToWishlist(const uint32_t userId, const uint32_t movieId);
	void RemoveMovieFromWishlist(const uint32_t userId, const uint32_t movieId);
	void MoveMovieFromWishlistToWatched(const uint32_t userId, const uint32_t movieId, const float rating);
};