cmake_minimum_required(VERSION 2.8)

# Set the project name
project (cf_example)

# set a project version
set (cf_example_VERSION_MAJOR 0)
set (cf_example_VERSION_MINOR 2)
set (cf_example_VERSION_PATCH 1)
set (cf_example_VERSION "${cf_example_VERSION_MAJOR}.${cf_example_VERSION_MINOR}.${cf_example_VERSION_PATCH}")

# Call configure files on ver.h.in to set the version.
# Uses the standard ${VARIABLE} syntax in the file
configure_file(ver.h.in ${PROJECT_BINARY_DIR}/ver.h)

# configure the path.h.in file.
# This file can only use the @VARIABLE@ syntax in the file
configure_file(path.h.in ${PROJECT_BINARY_DIR}/path.h @ONLY)

# include the directory with the new files
include_directories(${CMAKE_BINARY_DIR})

# Add an executable
add_executable(cf_example
    main.cpp
    )
