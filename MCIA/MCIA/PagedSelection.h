#pragma once
#include <vector>
#include "Filter.h"


template<class TEntity>
class PagedSelection
{
public:

	template<class sqlite_expression>
	static bool select(const int nmbRows, const int nmbPage, sqlite_expression filters);

	

private:
};

template<class TEntity>
template<class sqlite_expression>
bool PagedSelection<TEntity>::select(const int nmbRows, const int nmbPage, sqlite_expression filters)
{

}