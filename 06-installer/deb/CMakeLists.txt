cmake_minimum_required(VERSION 3.0)

project(cmake_examples_deb)

include_directories(
    ${PROJECT_SOURCE_DIR}/include
    )

# set a project version
set (deb_example_VERSION_MAJOR 0)
set (deb_example_VERSION_MINOR 2)
set (deb_example_VERSION_PATCH 2)
set (deb_example_VERSION "${deb_example_VERSION_MAJOR}.${deb_example_VERSION_MINOR}.${deb_example_VERSION_PATCH}")


############################################################
# Create a library
############################################################

# Source files to be used in the library
set(library_SOURCES
    src/Hello.cpp
)

#Generate the shared library from the library sources
add_library(cmake_examples_deb SHARED ${library_SOURCES})

############################################################
# Create an executable
############################################################

# Source fles for the binary
set(binary_SOURCES
    src/main.cpp
)

# Add an executable with the above sources
add_executable(cmake_examples_deb_bin ${binary_SOURCES})

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
