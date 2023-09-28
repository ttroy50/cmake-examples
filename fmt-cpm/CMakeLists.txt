cmake_minimum_required(VERSION 3.20)
project(my-project)

set(CMAKE_CXX_STANDARD 17)

include(cmake/CPM.cmake)
CPMAddPackage(
    NAME fmt
    GITHUB_REPOSITORY fmtlib/fmt
    GIT_TAG 7.1.3
    OPTIONS
        "FMT_HEADER_ONLY YES"
)

add_executable(greet main.cpp)
target_link_libraries(greet PRIVATE fmt::fmt)
