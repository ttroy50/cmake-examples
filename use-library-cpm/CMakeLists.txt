cmake_minimum_required(VERSION 3.28)
project(my-project)
include(cmake/CPM.cmake)

CPMAddPackage("gh:fmtlib/fmt#10.2.0")

add_executable(my-app main.cpp)
target_compile_features(my-app PRIVATE cxx_std_20)
target_link_libraries(my-app fmt)