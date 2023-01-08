cmake_minimum_required (VERSION 3.8)

enable_testing()

find_package(GTest REQUIRED)

add_executable(
  testing
  tests/UserTests.cpp  Source.cpp)

 target_link_libraries(testing 
	PRIVATE GTest::gmock GTest::gtest
	PUBLIC MCIALib)

include(GoogleTest)
gtest_discover_tests(testing)