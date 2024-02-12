cmake_minimum_required(VERSION 3.6)
project(tutorial)

# Add libraries 
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# Adding a basic addition executable
add_executable(profile src/main.cpp src/HyperProfiler.h src/HyperProfiler.cpp)
add_library(profiler_lib SHARED src/main.cpp)

# Setup testing
include(CTest)
add_subdirectory(tests)

enable_testing()
    