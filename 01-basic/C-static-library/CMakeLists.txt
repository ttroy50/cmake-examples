cmake_minimum_required(VERSION 2.6)

project(hello_library)

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

#Generate the static library from the library sources
add_library(hello_library STATIC ${library_SOURCES})

############################################################
# Create an executable
############################################################

# Source fles for the binary
set(binary_SOURCES
    src/main.cpp
)

# Add an executable with the above sources
add_executable(hello_binary ${binary_SOURCES})

# link the new hello_library target with the hello_binary target
target_link_libraries( hello_binary
    hello_library
)
