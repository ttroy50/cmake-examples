cmake_minimum_required(VERSION 3.5)

# Set the project name
project (imported_targets)


# find a boost install with the libraries filesystem and system
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)

# check if boost was found
if(Boost_FOUND)
    message ("boost found")
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

# Add an executable
add_executable(imported_targets main.cpp)

# link against the boost libraries
target_link_libraries( imported_targets
    PRIVATE
        Boost::filesystem
)
