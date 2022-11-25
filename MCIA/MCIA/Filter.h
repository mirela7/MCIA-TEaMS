#pragma once
#include <string>
#include <vector>
#include <sqlite_orm/sqlite_orm.h>


using namespace sqlite_orm;


template<class TENTITY>
class Filter
{
public:
	
	static auto columnStartsWithIn(const std::string& columnName, const std::vector<std::string>& values);
	static auto columnContains(const std::string& columnName, const std::string value);
	
	template<class T>
	static auto columnIs(T (TENTITY::*getter)() const, T value);


	template<typename T>
	static auto columnIsIn(const std::string& columnName, std::vector<T>& values);

	/*static Filter columnValueViaReferencedTableIs(const std::string& column, const std::string& referenceString);
											// genre_id.name = 

	template<class T_ENTITY1, class T_ENTITY2>
	static Filter columnsOfReferencedTablesEqual(const std::string& restrictionEntity1
												, const std::string& restrictionEntity2
												, const std::string& columnFromRefTable
												, const std::string& columnValue); */
	/*
	* ColumnOfREferencedTableEqual<Movie, Genre>("id={movie_genre}.movie_id", "id={movie_genre}.genre_id", "name", "Drama")
	*/

	Filter operator!();
	Filter operator||(const Filter& other);
	Filter operator&&(const Filter& other);

private:
};

template<class TENTITY>
template<class T>
inline auto Filter<TENTITY>::columnIs(T(TENTITY::* getter)() const, T value)
{
	return (c(&getter) == value);
}
