cmake_minimum_required(VERSION 3.5)
project (conan_third_party_include)

set(CMAKE_CXX_STANDARD 11)

# Included the conan build information
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

# Add an executable
add_executable(third_party_include main.cpp)

# link against the fmt target supplied by conan
target_link_libraries(third_party_include
    PRIVATE
        ${CONAN_LIBS}
)