#include "../include/MovieService.h"

DBPage<MovieService::WatchedMovieDisplayed> MovieService::GetWatchedMoviesOfUser(uint32_t userId, int page, int nmbRowsPerPage)
{
	/* SELECT watched_movie.movie_id as mid, watched_movie.user_id as uid, movie.title, genre.name FROM watched_movie
		JOIN movie ON watched_movie.movie_id = movie.id
		JOIN movie_genre ON movie.id = movie_genre.movie_id
		JOIN genre on movie_genre.genre_id = genre.id
		WHERE user_id = userId */

	int totalPages = std::ceil(DatabaseManagement::GetInstance().GetStorage().count<WatchedMovie>(
		where(c(&WatchedMovie::GetUserId) == userId)) * 1.0 / nmbRowsPerPage
	);

	auto watchedMovies = DatabaseManagement::GetInstance().GetStorage().select(
		columns(&WatchedMovie::GetMovieId, &WatchedMovie::GetUserId, &WatchedMovie::GetRating, &Movie::GetTitle),
		left_join<Movie>(on(c(&Movie::GetId) == &WatchedMovie::GetMovieId)),
		where(c(&WatchedMovie::GetUserId) == userId),
		limit(nmbRowsPerPage, offset(page * nmbRowsPerPage))
	);
	std::vector<MovieService::WatchedMovieDisplayed> simplifiedPageResults;
	for (auto& movieTuple : watchedMovies) {
		simplifiedPageResults.emplace_back(
			std::move(std::get<0>(movieTuple)),
			std::move(std::get<2>(movieTuple)),
			std::move(std::get<3>(movieTuple))
		);
	}
	return DBPage<MovieService::WatchedMovieDisplayed>(simplifiedPageResults, totalPages, page);
}