# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 2.6)

# Set the project name
project (hello_headers)

# Set the direcoties that should be included in the build command
# when running g++ these will be included as -I/directory/path/
include_directories(
    ${PROJECT_SOURCE_DIR}/inc
    )

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/Hello.cpp
    src/main.cpp
)


# Add an executable with the above sources
add_executable(${PROJECT_NAME} ${SOURCES})