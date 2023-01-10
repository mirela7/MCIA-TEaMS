#pragma once
#pragma warning(disable : 4996) /* To suppress warnings regarding deprecated C++17 functions. */

#include <iostream>
#include <sqlite_orm/sqlite_orm.h>
#include <functional>
#include <vector>
#include <tuple>

/* Entities */
#include "User.h"
#include "Movie.h"
#include "MovieIntermediary.h"
#include "Genre.h"
#include "WatchedMovie.h"
#include "WishList.h"
#include "MovieGenre.h"

/* Others */
#include "DBPage.h"
#include "OperationStatus.h"
#include "CodedException.h"
#include <filesystem>

using namespace sqlite_orm;

namespace {
    auto make_genre_table()
    {
        static auto el = make_table("genre",
            make_column("id",
                &Genre::GetId,
                &Genre::SetId,
                primary_key())
            , make_column("name",
                &Genre::GetName,
                &Genre::SetName,
                unique()));
        return el;
    }

    auto make_movieIntermediary_table() {
        static auto el = make_table("movieIntermediary",
            make_column("movieId",
                &MovieIntermediary::GetId,
                &MovieIntermediary::SetId,
                primary_key())
            , make_column("title",
                &MovieIntermediary::GetTitle,
                &MovieIntermediary::SetTitle)
            , make_column("genres",
                &MovieIntermediary::GetGenre,
                &MovieIntermediary::SetGenre));
        return el;
    }

    auto make_movie_table() {
        static auto el = make_table("movie",
            make_column("id",
                &Movie::GetId,
                &Movie::SetId,
                primary_key())
            , make_column("title",
                &Movie::GetTitle,
                &Movie::SetTitle)
            , make_column("release_year",
                &Movie::GetReleaseYear,
                &Movie::SetReleaseYear));
        return el;
    }

    auto make_movieGenre_table() {
        static auto el = make_table("movie_genre",
            make_column("movie_id",
                &MovieGenre::GetMovieId,
                &MovieGenre::SetMovieId,
                foreign_key(&MovieGenre::GetMovieId).references(&Movie::GetId)),
            make_column("genre_id",
                &MovieGenre::GetGenreId,
                &MovieGenre::SetGenreId,
                foreign_key(&MovieGenre::GetGenreId).references(&Genre::GetId)),
            primary_key(&MovieGenre::GetMovieId, &MovieGenre::GetGenreId)
            );
        return el;
    }

    auto make_user_table() {
        static auto el = make_table("user",
            make_column("id", 
                &User::GetId,
                &User::SetId,
                primary_key())
            , make_column("name",
                &User::GetName,
                &User::SetName)
            , make_column("password", 
                &User::GetPassword,
                &User::SetPassword));
        return el;
    }

    auto make_watched_movies_table() {
        static auto el = make_table("watched_movie"
            , make_column("user_id",
                &WatchedMovie::GetUserId,
                &WatchedMovie::SetUserId,
                foreign_key(&WatchedMovie::GetUserId).references(&User::GetId))
            , make_column("movie_id",
                &WatchedMovie::GetMovieId,
                &WatchedMovie::SetMovieId,
                foreign_key(&WatchedMovie::GetMovieId).references(&Movie::GetId))
            , make_column("rating",
                &WatchedMovie::GetRating,
                &WatchedMovie::SetRating)
            , primary_key(&WatchedMovie::GetUserId, &WatchedMovie::GetMovieId)
        );

        return el;
    }

    auto make_wishlist_table()
    {
        static auto el = make_table("wishlist"
            , make_column("user_id",
                &WishList::GetUserId,
                &WishList::SetUserId,
                foreign_key(&WishList::GetUserId).references(&User::GetId))
            , make_column("movie_id",
                &WishList::GetMovieId,
                &WishList::SetMovieId,
                foreign_key(&WishList::GetMovieId).references(&Movie::GetId))
            , primary_key(&WishList::GetUserId, &WishList::GetMovieId)
        );

        return el;
    }

    auto getStorage() {

        static auto storage = make_storage("..\\..\\..\\MCIA\\DBtest.db"
            , make_user_table()
            , make_movie_table()
            , make_genre_table()
            , make_movieIntermediary_table()
            , make_watched_movies_table()
            , make_wishlist_table()
            , make_movieGenre_table()
        );

        return storage;
    }

    using storage_type = decltype(getStorage());
};

class DatabaseManagement
{
public:
    static DatabaseManagement& GetInstance();
    storage_type& GetStorage();

    template<typename T>
    int32_t InsertElement(const T& el);

    template<typename T>
    T GetElementById(const int32_t id, bool throwIfNotFound = false);

    template<typename TEntity, typename TValue>
    TEntity GetElementByColumnValue(TValue (TEntity::*getter)() const, TValue value, bool throwIfNotFound = true);

    template<class TEntity, class sqlite_expression>
    DBPage<TEntity> PagedSelect(const int idxOfPage, const int nmbRowsPerPage, sqlite_expression filters);

    template<class TEntity, class sqlite_expression>
    DBPage<TEntity> QueryBasedPagedSelect(const int idxOfPage, const int nmbRowsPerPage, sqlite_expression statement);

private:
    DatabaseManagement() = default;
    DatabaseManagement(DatabaseManagement&) = delete;
    void operator=(DatabaseManagement&) = delete;

protected:
    storage_type m_storage = getStorage();
    static DatabaseManagement* m_database;
};


template<typename T>
int32_t DatabaseManagement::InsertElement(const T& el)
{
    try {
        return m_storage.insert(el);
    }
    catch (std::exception e) {
        std::cout << e.what();
    }
}

template<typename T>
inline T DatabaseManagement::GetElementById(const int32_t id, bool throwIfNotFound)
{
    try {
        return m_storage.get<T>(id);
    }
    catch (std::system_error e) {
        if (throwIfNotFound) throw e;
        return nullptr;
    };
}

template<typename TEntity, typename TValue>
inline TEntity DatabaseManagement::GetElementByColumnValue(TValue(TEntity::* getter)() const, TValue value, bool throwIfNotFound)
{
    auto result = m_storage.get_all<TEntity>(where(c(getter) == value));
    if (throwIfNotFound && result.size() < 1)
        throw CodedException(OperationStatus::Code::DB_ENTITY_NOT_FOUND, "No entity with wanted value found.");
    return result[0];
    
}

template<class TEntity, class sqlite_expression>
inline DBPage<TEntity> DatabaseManagement::PagedSelect(const int idxOfPage, const int nmbRowsPerPage, sqlite_expression filters)
{
    int totalPages = ceil(m_storage.count<TEntity>(where(filters)) * 1.0 / nmbRowsPerPage);
    auto result = m_storage.get_all<TEntity>(where(filters), limit(nmbRowsPerPage, offset(idxOfPage * nmbRowsPerPage)));
    return DBPage(result, totalPages, idxOfPage);
}

template<class TEntity, class sqlite_expression>
inline DBPage<TEntity> DatabaseManagement::QueryBasedPagedSelect(const int idxOfPage, const int nmbRowsPerPage, sqlite_expression statement)
{
    //int totalPages = ceil(m_storage.count<TEntity>(query) * 1.0 / nmbRowsPerPage);
    auto result = m_storage.execute(statement);
  //  std::vector<TEntity> r;
   // return DBPage<TEntity>(r, totalPages, idxOfPage);
}
