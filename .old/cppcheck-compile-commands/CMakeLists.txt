cmake_minimum_required (VERSION 3.5)

project(cppcheck_analysis)

# Have cmake create a compile database
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add a custom CMake Modules directory
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules
                      ${CMAKE_MODULE_PATH})

# find the cppcheck binary
find_package(CppCheck)

# Add sub directories
add_subdirectory(subproject1)
add_subdirectory(subproject2)
