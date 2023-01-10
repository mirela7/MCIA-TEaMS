#pragma once
#include "DBPage.h"
#include "DatabaseManagement.h"
#include "WatchedMovieDisplayer.h"

class MovieService {
public:	
	DBPage<WatchedMovieDisplayer> GetWatchedMoviesOfUser(uint32_t userId, int page, int nmbRowsPerPage);

};