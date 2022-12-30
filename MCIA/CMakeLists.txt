# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

project ("MCIA")
# Include sub-projects.
add_subdirectory (Validator)
add_subdirectory ("MCIA")
add_subdirectory (QT)
