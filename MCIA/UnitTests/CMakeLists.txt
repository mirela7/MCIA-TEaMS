cmake_minimum_required (VERSION 3.8)

message(STATUS "COMPILER ID: ${CMAKE_CXX_COMPILER_ID}")

# linking based on compiler used:
if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	find_package(GTest REQUIRED)
	include(GoogleTest)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
	include(FetchContent)

	FetchContent_Declare(
		googletest
		GIT_REPOSITORY https://github.com/google/googletest.git
		GIT_TAG        release-1.12.0
	)
	FetchContent_MakeAvailable(googletest)
	add_library(GTest::GTest INTERFACE IMPORTED)
	target_link_libraries(GTest::GTest INTERFACE gtest_main)
endif()

add_executable(
  testing
  tests/UserTests.cpp
  tests/AnswerTests.cpp
  tests/CodedExceptionTests.cpp
  Source.cpp)

 target_link_libraries(testing 
	PRIVATE GTest::gtest
	PUBLIC MCIALib
		 )

add_test(testing_t testing)
# gtest_discover_tests(testing)