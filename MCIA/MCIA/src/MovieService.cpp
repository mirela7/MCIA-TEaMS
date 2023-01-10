#include "../include/MovieService.h"

DBPage<WatchedMovieDisplayer> MovieService::GetWatchedMoviesOfUser(uint32_t userId, int page, int nmbRowsPerPage)
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
	std::vector<WatchedMovieDisplayer> simplifiedPageResults;
	for (auto& movieTuple : watchedMovies) {
		simplifiedPageResults.emplace_back(
			std::move(std::get<0>(movieTuple)),
			std::move(std::get<2>(movieTuple)),
			std::move(std::get<3>(movieTuple))
		);
	}
	return DBPage<WatchedMovieDisplayer>(simplifiedPageResults, totalPages, page);
}

MovieInformationDisplayer MovieService::GetMovieInformations(uint32_t id)
{
	/*
	SELECT *  movie.title, movie.release_year, genre.name FROM movie
	JOIN movie_genre on movie_genre.movie_id = movie.id
	JOIN genre on movie_genre.genre_id = genre.id
	WHERE movie.id = id
	*/
	auto informationRows = DatabaseManagement::GetInstance().GetStorage().select(
		columns(&Movie::GetTitle, &Movie::GetReleaseYear, &Genre::GetName),
		left_join<MovieGenre>(on(c(&MovieGenre::GetMovieId) == &Movie::GetId)),
		left_join<Genre>(on(c(&Genre::GetId) == &MovieGenre::GetGenreId)),
		where(c(&Movie::GetId) == id)
	);
	MovieInformationDisplayer movieInfoDisplayer(id, std::get<0>(informationRows[0]), std::get<1>(informationRows[0]));
	for (auto& row : informationRows) {
		movieInfoDisplayer.addGenre(std::move(std::get<2>(row)));
	}
	return movieInfoDisplayer;
}