cmake_minimum_required(VERSION 3.5)

# Set a default C++ compile flag
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)

# Set the project name
project (compile_flags)

# Add an executable
add_executable(cmake_examples_compile_flags main.cpp)

target_compile_definitions(cmake_examples_compile_flags 
    PRIVATE EX3
)
