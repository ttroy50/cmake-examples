cmake_minimum_required(VERSION 3.28)
project(my-project)
include_directories(include)
add_executable(my-app src/main.c src/greet.c)
