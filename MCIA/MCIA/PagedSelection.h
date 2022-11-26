#pragma once
#include <vector>
#include "DatabaseManagement.h"

enum ConsoleChars : char {
	WHITE_BLOCK = 219,
	GUILLEMET_LEFT = 174,
	GUILLEMET_RIGHT = 175
};

template<class TEntity>
struct Page {
	std::vector<TEntity> results;
	int nmbPages;
	int nmbCurrPage;

	Page(const std::vector<TEntity> res, int nPages, int nCurrPage)
		: results(res)
		, nmbPages(nPages)
		, nmbCurrPage(nCurrPage) { }

	friend std::ostream& operator<<(std::ostream& out, Page<TEntity> page)
	{
		for(int i = 0; i < 40; ++i)
			out << ConsoleChars::WHITE_BLOCK;
		out << " ";
		if(page.nmbCurrPage != 0)
			out << "[b] " << ConsoleChars::GUILLEMET_LEFT << " ";
		out << "Page " << page.nmbCurrPage+1 << "/" << page.nmbPages << " ";
		if (page.nmbCurrPage != page.nmbPages - 1)
			out << ConsoleChars::GUILLEMET_RIGHT << " [n] ";
		for (int i = 0; i < 40; ++i)
			out << ConsoleChars::WHITE_BLOCK;
		out << '\n';
		for (auto& elem : page.results)
			out << elem << '\n';
		for (int i = 0; i < 5; ++i)
			out << '\n';
		for (int i = 0; i < 110; ++i)
			out << ConsoleChars::WHITE_BLOCK;
		out << '\n';
		return out;
	}
};



template<class TEntity>
class PagedSelection
{
public:
	template<class sqlite_expression>
	static Page<TEntity> select(const int nmbRows, const int nmbPage, sqlite_expression filters);
private:

};

template<class TEntity>
template<class sqlite_expression>
Page<TEntity> PagedSelection<TEntity>::select(const int nmbRows, const int nmbPage, sqlite_expression filters)
{
	auto storage = DatabaseManagement::GetInstance().GetStorage(); 
	int totalPages = ceil(storage.count<TEntity>(where(filters)) * 1.0 / nmbRows);
	auto result = storage.get_all<TEntity>(where(filters), limit(nmbRows, offset(nmbPage * nmbRows)));

	auto var = c(&User::GetName) == "sorana";
	auto res = storage.get_all<User>(where(var));


	return Page(result, totalPages, nmbPage);
}