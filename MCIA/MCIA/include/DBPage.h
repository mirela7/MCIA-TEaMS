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
	DBPage() = default;
	DBPage(const std::vector<TEntity> res, int nPages, int nCurrPage);

	std::vector<TEntity>& GetResults();
	int GetNmbPages();
	int GetNmbCurrentPage();

	friend std::ostream& operator<<(std::ostream& out, DBPage<TEntity> page)
	{
		const int fieldWidth = 120;
		std::string displayed_paginator;
		if (page.GetNmbCurrentPage() != 0)
		{
			displayed_paginator = displayed_paginator + "[b] ";
			displayed_paginator.push_back(NamedAsciiChars::GUILLEMET_LEFT);
			displayed_paginator.push_back(' ');
		}
		displayed_paginator = displayed_paginator + "Page " + std::to_string(page.GetNmbCurrentPage() + 1) + "/" + std::to_string(page.GetNmbPages()) + " ";
		if (page.GetNmbCurrentPage() != page.GetNmbPages() - 1)
		{
			displayed_paginator.push_back(NamedAsciiChars::GUILLEMET_RIGHT);
			displayed_paginator += " [n] ";
		}

		int parted_size = (fieldWidth - displayed_paginator.size()) / 2;
		std::cout << std::setfill((char)NamedAsciiChars::WHITE_BLOCK) << std::setw(parted_size);
		std::cout << " " << displayed_paginator << " ";
		std::cout << std::setfill((char)NamedAsciiChars::WHITE_BLOCK) << std::setw(parted_size);
		std::cout << '\n';
		for (auto& elem : page.GetResults())
			out << elem << '\n';

		std::cout << std::setfill((char)NamedAsciiChars::WHITE_BLOCK) << std::setw(fieldWidth);
		out << '\n';
		return out;
	}
private:
	std::vector<TEntity> m_results;
	int m_nmbPages;
	int m_nmbCurrPage;

};

template<class TEntity>
DBPage<TEntity>::DBPage(const std::vector<TEntity> res, int nPages, int nCurrPage)
	: m_results(res)
	, m_nmbPages(nPages)
	, m_nmbCurrPage(nCurrPage)
{
}


template<class TEntity>
std::vector<TEntity>& DBPage<TEntity>::GetResults()
{
	return m_results;
}

template<class TEntity>
int DBPage<TEntity>::GetNmbPages()
{
	return m_nmbPages;
}

template<class TEntity>
int DBPage<TEntity>::GetNmbCurrentPage()
{
	return m_nmbCurrPage;
}
