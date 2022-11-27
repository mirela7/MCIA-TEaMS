#include "DatabaseManagement.h"
#include <iostream>

DatabaseManagement* DatabaseManagement::m_database = nullptr;

DatabaseManagement& DatabaseManagement::GetInstance()
{
    if (m_database == nullptr) {
        m_database = new DatabaseManagement();
        // m_database->m_storage.sync_schema();
    }
    return *m_database;
}


storage_type& DatabaseManagement::GetStorage()
{
    return m_storage;
}
