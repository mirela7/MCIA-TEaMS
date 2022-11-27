#pragma once
#include <iostream>
#include <vector>
#include "Utils/NamedAsciiChars.h"

template<class TEntity>
class DBPage {
public:
	std::vector<TEntity> results;
	int nmbPages;
	int nmbCurrPage;

	DBPage() = default;
	DBPage(const std::vector<TEntity> res, int nPages, int nCurrPage)
		: results(res)
		, nmbPages(nPages)
		, nmbCurrPage(nCurrPage) { }

	friend std::ostream& operator<<(std::ostream& out, DBPage<TEntity> page)
	{
		for(int i = 0; i < 40; ++i)
			out << NamedAsciiChars::WHITE_BLOCK;
		out << " ";
		if(page.nmbCurrPage != 0)
			out << "[b] " << NamedAsciiChars::GUILLEMET_LEFT << " ";
		out << "Page " << page.nmbCurrPage+1 << "/" << page.nmbPages << " ";
		if (page.nmbCurrPage != page.nmbPages - 1)
			out << NamedAsciiChars::GUILLEMET_RIGHT << " [n] ";
		for (int i = 0; i < 40; ++i)
			out << NamedAsciiChars::WHITE_BLOCK;
		out << '\n';
		for (auto& elem : page.results)
			out << elem << '\n';
		for (int i = 0; i < 5; ++i)
			out << '\n';
		for (int i = 0; i < 110; ++i)
			out << NamedAsciiChars::WHITE_BLOCK;
		out << '\n';
		return out;
	}
};
