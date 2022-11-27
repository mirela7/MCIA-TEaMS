#include "Movie.h"
#include "DatabaseManagement.h"

Movie::Movie(const uint16_t id, const std::string& title, const uint16_t releaseYear, const float rating)
	: m_id(id)
	, m_title(title)
	, m_releaseYear(releaseYear)
	, m_rating(rating)
{}

Movie::Movie(const Movie& movie)
{
	*this = movie;
}

Movie::Movie(Movie&& movie) noexcept
{
	*this = std::move(movie);
}

void Movie::SetId(const uint16_t id)
{
	m_id = id;
}
void Movie::SetTitle(const std::string& title)
{
	m_title = title;
}

void Movie::SetReleaseYear(const uint16_t releaseYear)
{
	m_releaseYear = releaseYear;
}

void Movie::SetRating(const float rating)
{
	m_rating = rating;
}

uint16_t Movie::GetId() const
{
	return m_id;
}

std::string Movie::GetTitle() const
{
	return m_title;
}

uint16_t Movie::GetReleaseYear() const
{
	return m_releaseYear;
}

float Movie::GetRating() const
{
	return m_rating;
}

Movie& Movie::operator=(const Movie& movie)
{
	m_id = movie.m_id;
	m_title = movie.m_title;
	m_releaseYear = movie.m_releaseYear;
	m_rating = movie.m_rating;
	return *this;
}

Movie& Movie::operator=(Movie&& movie) noexcept
{
	m_id = movie.m_id;
	m_title = movie.m_title;
	m_releaseYear = movie.m_releaseYear;
	m_rating = movie.m_rating;
	new(&movie) Movie;
	return *this;
}

void Movie::parse()
{
	auto& storage = DatabaseManagement::GetInstance().GetStorage();
		auto allMovies = storage.select(columns(&MovieIntermediary::GetId, &MovieIntermediary::GetTitle, &MovieIntermediary::GetGenre));

		std::cout << allMovies.size();
		int i = 0;
		for (auto& tpl : allMovies) {
			Movie m(std::get<0>(tpl), std::get<1>(tpl), 0, 0.0f);
			DatabaseManagement::GetInstance().InsertElement(m);
			i++;
			if (i % 1000 == 0)
				std::cout << "Inserted 1000 values: " << i << '\n';
		}
}

std::ostream& operator<<(std::ostream& out, const Movie& movie)
{
	return out << movie.GetId() << " " << movie.GetTitle() << " " << movie.GetReleaseYear();
}
