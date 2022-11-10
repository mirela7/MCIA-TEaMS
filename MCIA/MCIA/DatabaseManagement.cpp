#include "DatabaseManagement.h"
#include <iostream>

DatabaseManagement* DatabaseManagement::m_database = nullptr;

DatabaseManagement& DatabaseManagement::GetInstance()
{
    if (m_database == nullptr)
        m_database = new DatabaseManagement();
    return *m_database;
}

