#pragma once
#include <iostream>
#include <iomanip>
#include <string>
#include <vector>
#include <tuple>
#include "NamedAsciiChars.h"

template<class TEntity>
class DBPage {
public:
	std::vector<TEntity> results;
	int nmbPages;
	int nmbCurrPage;

	DBPage() = default;
	DBPage(const std::vector<TEntity> res, int nPages, int nCurrPage);

	friend std::ostream& operator<<(std::ostream& out, DBPage<TEntity> page)
	{
		const int fieldWidth = 120;
		std::string displayed_paginator;
		if (page.nmbCurrPage != 0) 
		{
			displayed_paginator = displayed_paginator + "[b] ";
			displayed_paginator.push_back(NamedAsciiChars::GUILLEMET_LEFT);
			displayed_paginator.push_back(' ');
		}
		displayed_paginator = displayed_paginator + "Page " + std::to_string(page.nmbCurrPage + 1) + "/" + std::to_string(page.nmbPages) + " ";
		if (page.nmbCurrPage != page.nmbPages - 1) 
		{
			displayed_paginator.push_back(NamedAsciiChars::GUILLEMET_RIGHT);
			displayed_paginator += " [n] ";
		}
		
		int parted_size = (fieldWidth - displayed_paginator.size()) / 2;
		std::cout << std::setfill((char)NamedAsciiChars::WHITE_BLOCK) << std::setw(parted_size);
		std::cout << " " << displayed_paginator << " ";
		std::cout << std::setfill((char)NamedAsciiChars::WHITE_BLOCK) << std::setw(parted_size);
		std::cout << '\n';
		for (auto& elem : page.results)
			out << elem << '\n';
		
		std::cout << std::setfill((char)NamedAsciiChars::WHITE_BLOCK) << std::setw(fieldWidth);
		out << '\n';
		return out;
	}
};

template<class TEntity>
DBPage<TEntity>::DBPage(const std::vector<TEntity> res, int nPages, int nCurrPage)
	: results(res)
	, nmbPages(nPages)
	, nmbCurrPage(nCurrPage)
{
}
