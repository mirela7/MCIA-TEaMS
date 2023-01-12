#pragma once
#include "DBPage.h"
#include "DatabaseManagement.h"
#include "WatchedMovieDisplayer.h"
#include "WishListDisplayer.h"
#include "MovieInformationDisplayer.h"

class MovieService {
public:	
	DBPage<WatchedMovieDisplayer> GetWatchedMoviesOfUser(uint32_t userId, int page, int nmbRowsPerPage);
	DBPage<WishListDisplayer> GetWishListOfUser(uint32_t userId, int page, int nmbRowsPerPage);
	MovieInformationDisplayer GetMovieInformations(uint32_t id);
};