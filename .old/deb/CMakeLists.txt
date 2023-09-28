cmake_minimum_required(VERSION 3.5)

project(cmake_examples_deb)

# set a project version
set (deb_example_VERSION_MAJOR 0)
set (deb_example_VERSION_MINOR 2)
set (deb_example_VERSION_PATCH 2)
set (deb_example_VERSION "${deb_example_VERSION_MAJOR}.${deb_example_VERSION_MINOR}.${deb_example_VERSION_PATCH}")


############################################################
# Create a library
############################################################

#Generate the shared library from the library sources
add_library(cmake_examples_deb SHARED src/Hello.cpp)

target_include_directories(cmake_examples_deb
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
############################################################
# Create an executable
############################################################

# Add an executable with the above sources
add_executable(cmake_examples_deb_bin src/main.cpp)

# link the new hello_library target with the hello_binary target
target_link_libraries( cmake_examples_deb_bin
    PUBLIC
        cmake_examples_deb
)

############################################################
# Install
############################################################

# Binaries
install (TARGETS cmake_examples_deb_bin
    DESTINATION bin)

# Library
# Note: may not work on windows
install (TARGETS cmake_examples_deb
    LIBRARY DESTINATION lib)

# Config
install (FILES cmake-examples.conf
    DESTINATION etc)

############################################################
# Create DEB
############################################################

# Tell CPack to generate a .deb package
set(CPACK_GENERATOR "DEB")

# Set a Package Maintainer.
# This is required
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Thom Troy")

# Set a Package Version
set(CPACK_PACKAGE_VERSION ${deb_example_VERSION})

# Include CPack
include(CPack)
