cmake_minimum_required(VERSION 2.8)

# Set the project name
project (third_party_include)


# find a boost install with the libraries filesystem and system
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)

# check if boost was found
if(Boost_FOUND)
    message ("boost found")

    # Include the boost headers
    include_directories(${Boost_INCLUDE_DIRS})
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

# Add an executable
add_executable(third_party_include main.cpp)

# link against the boost libraries
target_link_libraries( third_party_include
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_FILESYSTEM_LIBRARY}
)
