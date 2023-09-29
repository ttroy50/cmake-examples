cmake_minimum_required(VERSION 3.10)
project(hi)
enable_testing()
find_package(GTest REQUIRED)

add_executable(hi src/main.cpp src/greet.cpp)

add_executable(test_greet test/greet_test.cpp src/greet.cpp)
target_link_libraries(test_greet gtest::gtest)
add_test(test_greet test_greet)
