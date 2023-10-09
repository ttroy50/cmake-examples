cmake_minimum_required(VERSION 3.10)
project(myproject)
include_directories(include)
add_executable(myapp src/main.c src/greet.c)
