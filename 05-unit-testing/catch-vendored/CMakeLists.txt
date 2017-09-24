cmake_minimum_required(VERSION 3.0)

# Set the project name
project (catch_unit_test)


set(CMAKE_CXX_STANDARD 11)

# add the CMakeFile that defines catch
add_subdirectory(3rd_party/catch)

# Add an library for the example classes
add_library(example_unit_test
    Reverse.cpp
    Palindrome.cpp
)


#############################################
# Unit tests

# enable CTest testing
enable_testing()

# Add a testing executable
add_executable(unit_tests unit_tests.cpp)

target_link_libraries(unit_tests
    example_unit_test
    Catch::Test
)

add_test(test_all unit_tests)
