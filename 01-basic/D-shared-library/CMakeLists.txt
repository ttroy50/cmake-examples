cmake_minimum_required(VERSION 3.0)

project(hello_library)

############################################################
# Create a library
############################################################

# Source files to be used in the library
set(library_SOURCES
    src/Hello.cpp
)

#Generate the shared library from the library sources
add_library(hello_library SHARED ${library_SOURCES})
add_library(hello::library ALIAS hello_library)

target_include_directories(hello_library
    PUBLIC ${PROJECT_SOURCE_DIR}/include
)

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
    PRIVATE hello::library
)
