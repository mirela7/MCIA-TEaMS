#pragma once
#include <vector>
#include "Filter.h"


template<class TEntity>
class PagedSelection
{
public:

	template<class sqlite_expression>
	static bool select(const sqlite_expression filters, const int nmbRows, const int nmbPage);

	

private:
};

template<class TEntity>
template<class sqlite_expression>
inline bool PagedSelection<TEntity>::select(const sqlite_expression filters, const int nmbRows, const int nmbPage)
{
	return false;
}
