cmake_minimum_required(VERSION 2.6)

project(cmake_examples_install)

include_directories(
    ${PROJECT_SOURCE_DIR}/inc
    )

############################################################
# Create a library
############################################################

# Source files to be used in the library
set(library_SOURCES
    src/Hello.cpp
)

#Generate the shared library from the library sources
add_library(cmake_examples_inst SHARED ${library_SOURCES})

############################################################
# Create an executable
############################################################

# Source fles for the binary
set(binary_SOURCES
    src/main.cpp
)

# Add an executable with the above sources
add_executable(cmake_examples_inst_bin ${binary_SOURCES})

# link the new hello_library target with the hello_binary target
target_link_libraries( cmake_examples_inst_bin
    cmake_examples_inst
)

############################################################
# Install
############################################################

# Binaries
install (TARGETS cmake_examples_inst_bin
    DESTINATION bin)

# Library
# Note: may not work on windows
install (TARGETS cmake_examples_inst
    LIBRARY DESTINATION lib)


# Config
install (FILES cmake-examples.conf
    DESTINATION etc)
