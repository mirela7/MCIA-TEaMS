#include "../include/User.h"
#include "../include/RecomSystem.h"
#include <thread>
#include <iostream>

User::User(const uint16_t& id, const std::string& name, const std::string& password)
	: m_id(id)
	, m_name(name)
	, m_password(password)
{}

User::User(const User & other)
{
	m_id = other.m_id;
	m_name = other.m_name;
	m_password = other.m_password;
}

User::User(const std::string& name, const std::string& password)
{
	m_id = 0;
	m_name = name;
	m_password = password;
}

User& User::operator=(const User& user)
{
	if (this != &user) {  

		m_id = user.m_id;
		m_name = user.m_name;
		m_password = user.m_password;
	}

	return *this;
}

User& User::operator=(User&& other) noexcept
{
	m_id = other.m_id;
	m_name = other.m_name;
	m_password = other.m_password;		
	new(&other) User;
	return *this;
}

User::User(User&& other) noexcept
{
	*this = std::move(other);
}

User::~User()
{}

std::string User::GetPassword() const
{
	return m_password;
}

std::string User::GetName() const
{
	return m_name;
}

uint16_t User::GetId() const 
{
	return m_id;
}

void User::SetName(const std::string& name)
{
	m_name = name;
}

void User::SetPassword(const std::string& password)
{
	m_password = password;
}

void User::SetId(uint16_t id)
{
	m_id = id;
}

std::ostream& operator<<(std::ostream& g, const User& u)
{
	return g << u.m_id << " " << u.m_name;
}

void User::StartPopulatingRecommendedMovies() {
    auto getRecommendedMoviesTask = [&](){
        //std::this_thread::sleep_for(std::chrono::seconds(5));
        std::cout<<"recom"<<std::this_thread::get_id()<<"\n";
        return RecomSystem::GetInstance().GetRecommendedMovies(GetId(), 100, 10);
    };
    m_recommendedMoviesFuture = std::async(std::launch::async, getRecommendedMoviesTask);
}


std::vector<uint16_t> User::GetRecommendedMovies() {
    //either return the result, or wait for the thread to finish
    if(m_recommendedMovies.empty())
        m_recommendedMovies = std::move(m_recommendedMoviesFuture.get());
    return m_recommendedMovies;
}
