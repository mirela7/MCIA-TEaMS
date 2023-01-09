cmake_minimum_required (VERSION 3.8)


find_package(GTest REQUIRED)


include(GoogleTest)


add_executable(
  testing
  tests/UserTests.cpp  
  tests/CodedExceptionTests.cpp
  Source.cpp)

 target_link_libraries(testing 
	PRIVATE GTest::gmock GTest::gtest
	PUBLIC MCIALib)

add_test(testing_t testing)
# gtest_discover_tests(testing)