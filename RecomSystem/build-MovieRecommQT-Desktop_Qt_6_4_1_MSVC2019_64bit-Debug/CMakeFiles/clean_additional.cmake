# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\MovieRecommQT_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\MovieRecommQT_autogen.dir\\ParseCache.txt"
  "MovieRecommQT_autogen"
  )
endif()
