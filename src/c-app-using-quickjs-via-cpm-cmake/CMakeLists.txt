cmake_minimum_required(VERSION 3.12)
project(my-app)
include(cmake/CPM.cmake)
CPMAddPackage("gh:mezum/quickjs-cmake#master")
set(CMAKE_C_STANDARD 23)

add_executable(my-app src/main.c)
target_link_libraries(my-app quickjs)
