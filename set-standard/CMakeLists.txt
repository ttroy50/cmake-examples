cmake_minimum_required(VERSION 3.20)
project(my-project)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED TRUE)
add_executable(app1 src/main1.c)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
add_executable(app2 src/main2.cpp)
