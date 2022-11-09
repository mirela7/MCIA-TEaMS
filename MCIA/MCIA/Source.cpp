#include <iostream>
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;

struct User {
    int id;
    std::string firstName;
    std::string parola;
};

int main()
{
    auto storage = make_storage("testdb.db",
        make_table("User",
            make_column("Id", &User::id, primary_key()),
            make_column("name", &User::firstName),
            make_column("password", &User::parola)));
    try {
        auto user = storage.get<User>(1);
        std::cout << "user = " << user.firstName << " " << user.parola << std::endl;
    }
    catch (std::system_error e) {
        std::cout << e.what() << std::endl;
    }
    catch (...) {
        std::cout << "unknown exeption" << std::endl;
    }
	return 0;
}