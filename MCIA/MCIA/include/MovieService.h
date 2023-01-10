#pragma once
#include "DBPage.h"
#include "DatabaseManagement.h"

class MovieService {
public:
	struct WatchedMovieDisplayed {
		uint32_t movieId;
		std::string movieTitle;
		double rating;

		WatchedMovieDisplayed(uint32_t mvId, double r, const std::string& mvTitle) {
			movieId = mvId;
			movieTitle = mvTitle;
			rating = r;
		}

		friend std::ostream& operator<<(std::ostream& g, WatchedMovieDisplayed wmd) {
			g << wmd.movieId << " " << wmd.movieTitle << " ";
			return g << std::fixed << std::setprecision(1) << wmd.rating << "/5.0\n";
		}
	};

	DBPage<WatchedMovieDisplayed> GetWatchedMoviesOfUser(uint32_t userId, int page, int nmbRowsPerPage);

	/*template<class TENTITY>
	DBPage<TENTITY> GetWishedMoviesOfUser(uint32_t userId, int page, int nmbRowsPerPage);
	*/
public:
};